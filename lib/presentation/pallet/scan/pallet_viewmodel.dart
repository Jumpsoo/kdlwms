import 'package:flutter/material.dart';
import 'package:kdlwms/domain/model/note.dart';
import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/use_case/use_cases_wms.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_events.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_state.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class PalletViewModel with ChangeNotifier {
  final UseCasesWms useCasesWms;

  PalletState _state = PalletState(
    pallets: [],
    isLoading: true,
  );

  PalletState get state => _state;

  PalletViewModel(
    this.useCasesWms,
  ) {
    //
  }

  void onEvent(PalletEvent event) {

    event.when(
      listPallets: listPallets,
      addPallet: addPallet,
      updatePallet: updatePallet,
      deletePallet: deletePallet,
      scanQRData: scanQRData,
      getPalletBySeq: getPalletBySeq,

    );
  }

  Future<void> listPallets(String workShop) async {
    List<Pallet> pallets = await useCasesWms.listPallets(workShop);
    _state = state.copyWith(
      pallets: pallets,
    );
    notifyListeners();
  }

  // Future<void> _addPallet(Pallet pallet) async {
  Future<void> addPallet(String sQRData) async {
    // 변환해서 넘겨준다.
    Pallet? pallet = scanQRData(sQRData);
    if (pallet == null) {
      return;
    }
    await useCasesWms.addPallet(pallet);
    // await listPallets(pallet.WORKSHOP);
  }

  Future<void> updatePallet(Pallet pallet) async {
    await useCasesWms.updatePallet(pallet);
    await listPallets(pallet.WORKSHOP);
  }

  Future<void> deletePallet(Pallet pallet) async {
    await useCasesWms.deletePallet(pallet);
    await listPallets(pallet.WORKSHOP);
  }
  Future<Pallet> getPalletBySeq(int palletSeq) async {
    Pallet pallet = await useCasesWms.getPalletBySeq(palletSeq);
    return pallet;
  }


  //리딩한 값 파싱은 여기서 진행
  Pallet? scanQRData(String sQRData) {
    int nPalletSeq = 1;
    String sWorkShop = '';
    String sLocation = '';
    String sItemNo = '';
    String sItemLot = '';

    int nQty = 1;
    int nState = 0;
    int nBoxNo = 0;

    Pallet pallet;
    final splitted = sQRData.split('\t');
    if (splitted == null || splitted.length == 0) {
      return null;
    }
    pallet = Pallet(
      PALLET_SEQ: int.parse(splitted[0]),
      WORKSHOP: splitted[1],
      LOCATION: splitted[2],
      ITEM_NO: splitted[3],
      ITEM_LOT: splitted[4],
      STATE: int.parse(splitted[5]),
      QUANTITY: int.parse(splitted[6]),
      BARCODE: sQRData,
      SCAN_DATE: DateTime.now(),
      SCAN_USERNM: gDeviceName,
      BOX_NO: int.parse(splitted[7]),
    );

    return pallet;
  }
}

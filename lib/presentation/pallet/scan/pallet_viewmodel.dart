import 'package:flutter/material.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
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
      updatePalletState: updatePalletState,
      deletePallet: deletePallet,
      deletePalletAll: deletePalletAll,
      scanQRData: scanQRData,
      getPalletBySeq: getPalletBySeq,
      getPalletCountInDevice : getPalletCountInDevice,
    );
  }

  Future<void> listPallets(
      String sWorkShop, String sLocation, int nState) async {
    List<TbWhPallet>? palletlist =
        await useCasesWms.listPallets(sWorkShop, sLocation, nState);

    _state = state.copyWith(
      pallets: palletlist,
    );
    notifyListeners();
  }

  // Future<void> _addPallet(Pallet pallet) async {
  Future<bool> addPallet(String sQRData) async {
    TbWhPallet? pallet = scanQRData(sQRData);
    if (pallet == null) {
      return false;
    }
    return await useCasesWms.addPallet(pallet);
    // await listPallets(pallet.WORKSHOP);
  }

  Future<void> updatePallet(List<TbWhPallet> pallets) async {
    return await useCasesWms.updatePallet(pallets);
  }

  Future<void> updatePalletState(List<TbWhPallet> pallets) async {
    return await useCasesWms.updatePalletState(pallets);
  }

  Future<bool> deletePallet(List<TbWhPallet> pallets) async {
    return await useCasesWms.deletePallet(pallets);
  }

  Future<bool> deletePalletAll() async {
    return await useCasesWms.deletePalletAll();
  }

  Future<TbWhPallet?> getPalletBySeq(int palletSeq) async {
    TbWhPallet? pallet = await useCasesWms.getPalletBySeq(palletSeq);
    return pallet;
  }

  Future<int> getPalletCountInDevice() async {
    return await useCasesWms.getPalletCountInDevice();
  }


  //리딩한 값 파싱은 여기서 진행
  TbWhPallet? scanQRData(String sQRData) {
    TbWhPallet pallet;
    final convertedData = sQRData.split('\t');
    if (convertedData.isEmpty) {
      return null;
    }
    pallet = TbWhPallet(
      PALLET_SEQ: int.parse(convertedData[0]),
      WORKSHOP: convertedData[1],
      LOCATION: convertedData[2],
      ITEM_NO: convertedData[3],
      ITEM_LOT: convertedData[4],
      STATE: int.parse(convertedData[5]),
      QUANTITY: int.parse(convertedData[6]),
      BARCODE: sQRData,
      SCAN_DATE: DateTime.now(),
      SCAN_USERNM: gDeviceName,
      BOX_NO: int.parse(convertedData[7]),
    );

    return pallet;
  }

}

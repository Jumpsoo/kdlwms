import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';
import 'package:kdlwms/domain/use_case/use_case_wms.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_events.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_state.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class PalletViewModel with ChangeNotifier {
  final UseCaseWms useCasesWms;

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
      listPallets: _listPallets,
      selectCheckValue: _selectCheckValue,
      addPallet: _addPallet,
      updatePallet: _updatePallet,
      updatePalletLoadState: _updatePalletLoadState,
      deletePallet: _deletePallet,
      deletePalletAll: _deletePalletAll,
      scanQRData: _scanQRData,
      getPalletCountInDevice: _getPalletCountInDevice,
    );
  }

  //현재 location 값은 불명확함
  Future<void> _listPallets(
      String sWorkShop, String sLocation, int nState) async {
    List<TbWhPallet>? palletlist =
        await useCasesWms.selectPackingListUseCase(sWorkShop, sLocation);

    _state = state.copyWith(
      pallets: palletlist,
    );
    notifyListeners();
  }

  Future<Result<bool>?> _selectCheckValue(TbWhPallet tbWhPallet) async {
    return await useCasesWms.selectCheckValue(tbWhPallet);
  }

  // Future<void> _addPallet(Pallet pallet) async {
  Future<Result<bool>> _addPallet(TbWhPallet? pallet) async {
    if (pallet == null) {
      return const Result.error('팔레트정보가 없습니다.');
    }
    return await useCasesWms.addPallet(pallet);
  }

  Future<void> _updatePallet(List<TbWhPallet> pallets) async {
    return await useCasesWms.updatePallet(pallets);
  }

  //상차완료시 상태변경
  Future<Result<bool>> _updatePalletLoadState(
      List<TbWhPalletPrint> pallets, String sState) async {
    return await useCasesWms.loadingPalletFinishUseCase(pallets);
  }

  Future<Result<bool>> _deletePallet(List<TbWhPallet> pallets) async {
    return await useCasesWms.deletePallet(pallets);
  }

  Future<Result<bool>> _deletePalletAll() async {
    return await useCasesWms.deletePalletAllUseCase();
  }

  Future<int> _getPalletCountInDevice() async {
    return await useCasesWms.getPalletCountInDevice();
  }

  //리딩한 값 파싱은 여기서 진행
  TbWhPallet? _scanQRData(String sQRData) {
    TbWhPallet pallet;
    final convertedData = sQRData.split(gSplitCharacter);
    if (convertedData.isEmpty) {
      return null;
    }
    try {
      pallet = TbWhPallet(
        workshop: convertedData[1],
        location: convertedData[2],
        itemNo: convertedData[3],
        itemLot: convertedData[4],
        state: convertedData[5],
        quantity: int.parse(convertedData[6]),
        barcode: sQRData,
        scanDate: DateTime.now(),
        scanUsernm: gDeviceId,
        boxNo: int.parse(convertedData[7]),
      );
    } catch (e) {
      return null;
    }
    return pallet;
  }
}

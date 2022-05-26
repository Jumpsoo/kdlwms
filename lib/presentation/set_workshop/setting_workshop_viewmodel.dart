import 'package:flutter/material.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/use_case_tb_cm_location.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_events.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_state.dart';

class SettingWorkshopViewModel with ChangeNotifier {

  final UseCaseTbCmLocation useCaseTbCmLocation;

  SettingWorkshopViewModel(this.useCaseTbCmLocation) {
    //
  }

  SettingWorkshopState _state = SettingWorkshopState(
    tbCmLocations: [],
    isLoading: true,
  );

  SettingWorkshopState get state => _state;

  void onEvent(SettingWorkShopEvents event) {
    event.when(
      selectTbCmLocationAll: selectTbCmLocationAll,
      selectTbCmLocation: selectTbCmLocation,
      insertTbCmLocation: insertTbCmLocation,
      batchInsertTbCmLocation : batchInsertTbCmLocation,
    );
  }

  //작업장 리스트 조회
  Future<List<TbCmLocation>?> selectTbCmLocationAll() async {
    return await useCaseTbCmLocation.selectTbCmLocationAll();
  }

  //작업장 리스트 조회
  Future<List<TbCmLocation>?> selectTbCmLocation(TbCmLocation tbCmLocation) async {
    return await useCaseTbCmLocation.selectTbCmLocation(tbCmLocation);
  }
  // Future<void> _addPallet(Pallet pallet) async {
  Future<bool> insertTbCmLocation(TbCmLocation tbCmLocation) async {
    return await useCaseTbCmLocation.addTbCmLocation(tbCmLocation);
    // await listPallets(pallet.WORKSHOP);
  }

  // Future<void> _addPallet(Pallet pallet) async {
  // 리스트 구성후 저장 할것
  Future<bool> batchInsertTbCmLocation(List<TbCmLocation> tbCmLocations) async {
    return await useCaseTbCmLocation.batchInsertTbCmLocation(tbCmLocations);
    // await listPallets(pallet.WORKSHOP);
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/use_case_tb_cm_location.dart';
import 'package:kdlwms/kdl_common/com_ui/comm_ui_events.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_events.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_state.dart';

class SettingInfoViewModel with ChangeNotifier {

  final UseCaseCommonInfo useCaseCommonInfo;

  SettingInfoViewModel(this.useCaseCommonInfo) ;

  final StreamController<CommUiEvents> _eventController = StreamController<CommUiEvents>();
  Stream<CommUiEvents> get eventStream => _eventController.stream;

  SettingWorkshopState _state = SettingWorkshopState(
    tbCmLocations: [],
    isLoading: true,
  );

  SettingWorkshopState get state => _state;

  void onEvent(SettingWorkShopEvents event) {
    event.when(
      selectTbCmLocationAll: _selectTbCmLocationAll,
      selectTbCmLocation: _selectTbCmLocation,
      selectTbCmLocationCurrentItem: _selectTbCmLocationCurrentItem,
      updateTbCmLocation: _updateTbCmLocation,
      updateFromSelectTbCmLocationToEnable: _updateFromSelectTbCmLocationToEnable,
      updateFromSelectTbCmLocationToDisableAll: _updateFromSelectTbCmLocationToDisableAll,
      insertTbCmLocation: _insertTbCmLocation,
      batchInsertTbCmLocation : _batchInsertTbCmLocation,
    );
  }

  //작업장 리스트 조회
  Future<Result<List<TbCmLocation>?>> _selectTbCmLocationAll() async {
    Result result = await useCaseCommonInfo.selectTbCmLocationAll();

    result.when(success: (value){
       _eventController.add(const CommUiEvents.showSnackBar('조회 되었습니다.'));
      return Result.success(value);
    }, error: (message){
      _eventController.add(CommUiEvents.showSnackBar(message));
      return Result.error(message);
    });

    return const Result.error('비정상 처리됨');
  }
  //작업장 리스트 조회
  Future<Result<List<TbCmLocation>?>> _selectTbCmLocation(TbCmLocation tbCmLocation) async {

    return await useCaseCommonInfo.selectTbCmLocation(tbCmLocation);
  }
  //작업장 리스트 조회
  Future<Result<TbCmLocation?>> _selectTbCmLocationCurrentItem() async {
    return await useCaseCommonInfo.selectTbCmLocationCurrentItem();
  }

  // Future<void> _addPallet(Pallet pallet) async {
  Future<Result<bool>> _insertTbCmLocation(TbCmLocation tbCmLocation) async {
    return await useCaseCommonInfo.addTbCmLocation(tbCmLocation);
    // await listPallets(pallet.WORKSHOP);
  }

  // Future<void> _addPallet(Pallet pallet) async {
  Future<Result<bool>> _updateTbCmLocation(TbCmLocation tbCmLocation) async {
    return await useCaseCommonInfo.updateTbCmLocation(tbCmLocation);
    // await listPallets(pallet.WORKSHOP);
  }

  // Future<void> _addPallet(Pallet pallet) async {
  Future<Result<bool>> _updateFromSelectTbCmLocationToEnable(String sWorkShop) async {
    return await useCaseCommonInfo.updateFromSelectTbCmLocationToEnable(sWorkShop);
    // await listPallets(pallet.WORKSHOP);
  }

  // Future<void> _addPallet(Pallet pallet) async {
  Future<Result<bool>> _updateFromSelectTbCmLocationToDisableAll() async {
    return await useCaseCommonInfo.updateFromSelectTbCmLocationToDisableAll();
    // await listPallets(pallet.WORKSHOP);
  }

  // Future<void> _addPallet(Pallet pallet) async {
  Future<Result<bool>> insertTbCmLocation(TbCmLocation tbCmLocation) async {
    return await useCaseCommonInfo.addTbCmLocation(tbCmLocation);
    // await listPallets(pallet.WORKSHOP);
  }

  // Future<void> _addPallet(Pallet pallet) async {
  // 리스트 구성후 저장 할것
  Future<Result<bool>> _batchInsertTbCmLocation(List<TbCmLocation> tbCmLocations) async {
    return await useCaseCommonInfo.batchInsertTbCmLocation(tbCmLocations);
    // await listPallets(pallet.WORKSHOP);
  }
}

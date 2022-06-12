import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/use_case/use_case_data_batch.dart';
import 'package:kdlwms/kdl_common/batch/data_sync_events.dart';
import 'package:kdlwms/kdl_common/batch/data_sync_state.dart';
import 'package:kdlwms/kdl_common/com_ui/comm_ui_events.dart';

class DataSyncViewModel with ChangeNotifier {
  final UseCaseDataBatch useCaseDataBatch;

  final DataSyncState _state = DataSyncState(
    isLoading: true,
  );

  DataSyncViewModel(
    this.useCaseDataBatch,
  ) {
    //
  }

  final _eventController = StreamController<CommUiEvents>();

  Stream<CommUiEvents> get eventStreams => _eventController.stream;

  // Stream<CommUiEvents> get eventStream => _eventController.stream;

  void onEvent(DataSyncEvent event) {
    event.when(
      migTbWhCmCode: _migTbWhCmCode,
      migTbWhItem: _migTbWhItem,
      migTbCmLocation: _migTbCmLocation,
      migTbCmSync: _migTbCmSync,
    );
  }

  Future<Result<bool>> _migTbWhCmCode(TbWhCmCode condTbWhCmCode, String sBachName) async {

    Result result = await useCaseDataBatch.migTbWhCmCode(condTbWhCmCode, '[공통코드]');
    result.when(success: (message) {
      _eventController.add(CommUiEvents.showSnackBar(message));
    }, error: (message) {
      _eventController.add(CommUiEvents.showSnackBar(message));
    });
    return const Result.success(true);
  }

  Future<Result<bool>> _migTbWhItem(List<TbWhItem> tbWhItems) async {
    //조건이있을 경우 추가 할 것
    TbWhItem condTbWhItem = TbWhItem();
    Result result = await useCaseDataBatch.migTbWhItem(condTbWhItem);
    result.when(success: (value){}, error: (message){
      return Result.error(message);
    });
    return const Result.success(true);
  }

  Future<Result<bool>> _migTbCmLocation(List<TbCmLocation> tbCmLocations) async {
    Result result = await useCaseDataBatch.migTbCmLocation();
    result.when(success: (value){}, error: (message){
      return Result.error(message);
    });
    return const Result.success(true);
  }

  Future<Result<bool>> _migTbCmSync(List<TbCmSync> tbCmSyncs) async {
    Result result = await useCaseDataBatch.migTbCmSync(tbCmSyncs);
    result.when(success: (value){}, error: (message){
      return Result.error(message);
    });
    return const Result.success(true);
  }

  // 버전 저회
  Future<Result<TbCmSync>> _getCurrentVersionRow() async {
    Result result = await useCaseDataBatch.getCurrentVersionRow();
    result.when(success: (value){
      return Result.success(value);
    }, error: (message){
      return Result.error(message);
    });
    return Result.error('에러');
  }

}
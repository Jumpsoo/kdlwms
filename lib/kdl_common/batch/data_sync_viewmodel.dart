import 'package:flutter/material.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/use_case/use_case_data_batch.dart';
import 'package:kdlwms/kdl_common/batch/data_sync_events.dart';

class DataSyncViewModel with ChangeNotifier {
  final UseCaseDataBatch useCaseDataBatch;

  DataSyncViewModel(
    this.useCaseDataBatch,
  ) {}

  void onEvent(DataSyncEvent event) {
    event.when(
      migTbWhCmCode: migTbWhCmCode,
      migTbWhItem: migTbWhItem,
      migTbCmLocation: migTbCmLocation,
      migTbCmSync: migTbCmSync,
    );
  }
  Future<bool> migTbWhCmCode(List<TbWhCmCode> tbWhCmCodes) async {
    return await useCaseDataBatch.migTbWhCmCode(tbWhCmCodes);
  }

  Future<bool> migTbWhItem(List<TbWhItem> tbWhItems) async {
    return await useCaseDataBatch.migTbWhItem(tbWhItems);
  }

  Future<bool> migTbCmLocation(List<TbCmLocation> tbCmLocations)  async {
    return await useCaseDataBatch.migTbCmLocation(tbCmLocations);
  }

  Future<bool> migTbCmSync(List<TbCmSync> tbCmSyncs) async  {
    return await useCaseDataBatch.migTbCmSync(tbCmSyncs);
  }
}

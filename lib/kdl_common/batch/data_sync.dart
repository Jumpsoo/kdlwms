import 'package:flutter/material.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/kdl_common/batch/data_sync_viewmodel.dart';
import 'package:provider/provider.dart';

Future<bool> syncData(BuildContext context) async {
  DataSyncViewModel viewModel = context.watch<DataSyncViewModel>();

  // 01. 공통코드 리스트 처리
  if (await viewModel.useCaseDataBatch.migTbWhCmCode(getTbWhCmCodeList()) ==
      false) {
    return false;
  }

  // 02. 품목정보 리스트
  if (await viewModel.useCaseDataBatch.migTbWhItem(getTbWhItemList()) ==
      false) {
    return false;
  }

  // 03. 작업장 정보 리스트
  if (await viewModel.useCaseDataBatch.migTbCmLocation(getTbCmLocationList()) ==
      false) {
    return false;
  }

  // 04. 동기화 정보 리스트
  if (await viewModel.useCaseDataBatch.migTbCmSync(getTbCmSyncList()) ==
      false) {
    return false;
  }
  return true;
}

//▼ import 용 데이터 정비
// 01. 공통코드 리스트
List<TbWhCmCode> getTbWhCmCodeList() {
  List<TbWhCmCode> retList = [];

  return retList;
}

// 02. 품목정보 리스트
List<TbWhItem> getTbWhItemList() {
  List<TbWhItem> retList = [];

  return retList;
}

// 03. 작업장 정보 리스트
List<TbCmLocation> getTbCmLocationList() {
  List<TbCmLocation> retList = [];

  return retList;
}

// 04. 동기화 정보 리스트
List<TbCmSync> getTbCmSyncList() {
  List<TbCmSync> retList = [];

  return retList;
}

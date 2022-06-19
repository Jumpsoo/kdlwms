import 'package:kdlwms/domain/use_case/tb_cm_location/add_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/batch_inert_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/delete_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/select_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/update_tb_cm_location.dart';

import 'package:kdlwms/domain/use_case/tb_cm_code/delete__tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/insert_tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/select_tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/update_tb_cm_code.dart';

class UseCaseCommonInfo {
  //작업장 정보
  final AddTbCmLocation  addTbCmLocation;
  final UpdateTbCmLocation updateTbCmLocation;
  final UpdateFromSelectTbCmLocationToEnable updateFromSelectTbCmLocationToEnable;
  final UpdateFromSelectTbCmLocationToDisableAll updateFromSelectTbCmLocationToDisableAll;

  final DeleteTbCmLocation deleteTbCmLocation;
  final SelectTbCmLocationAll selectTbCmLocationAll;
  final SelectTbCmLocationCurrentItem selectTbCmLocationCurrentItem;
  final SelectTbCmLocation selectTbCmLocation;
  final BatchInsertTbCmLocation batchInsertTbCmLocation;

  //공통 코드
  final GetTbWhCmCodeList getTbWhCmCodeList;
  final GetCurrentLocalVersion getCurrentLocalVersion;
  final SelectTbWhCmCodeListByGrpCd selectTbWhCmCodeListByGrpCd;
  final SelectTbWhCmCodeListByCodeCd selectTbWhCmCodeListByCodeCd;

  final InsertTbWhCmCode insertTbWhCmCode;
  final UpdateTbWhCmCode updateTbWhCmCode;
  final DeleteTbWhCmCode deleteTbWhCmCode;
  final DeleteTbWhCmCodeAll deleteTbWhCmCodeAll;

  UseCaseCommonInfo({
    required this.addTbCmLocation,
    required this.updateTbCmLocation,
    required this.updateFromSelectTbCmLocationToEnable,
    required this.updateFromSelectTbCmLocationToDisableAll,
    required this.deleteTbCmLocation,
    required this.selectTbCmLocation,
    required this.selectTbCmLocationAll,
    required this.selectTbCmLocationCurrentItem,
    required this.batchInsertTbCmLocation,


    required this.getTbWhCmCodeList,
    required this.getCurrentLocalVersion,
    required this.selectTbWhCmCodeListByGrpCd,
    required this.selectTbWhCmCodeListByCodeCd,
    required this.insertTbWhCmCode,
    required this.updateTbWhCmCode,
    required this.deleteTbWhCmCode,
    required this.deleteTbWhCmCodeAll,
  });
}

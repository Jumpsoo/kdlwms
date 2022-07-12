
import 'package:kdlwms/domain/use_case/tb_cm_code/delete__tb_cm_code.dart';

import 'package:kdlwms/domain/use_case/tb_cm_code/insert_tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/select_tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/update_tb_cm_code.dart';

class UseCaseTbCmCode {
  final GetTbWhCmCodeList getTbWhCmCodeList;
  final SelectTbWhCmCodeListByGrpCd selectTbWhCmCodeListByGrpCd;
  final SelectTbWhCmCodeListByCodeCd selectTbWhCmCodeListByCodeCd;

  final InsertTbWhCmCode insertTbWhCmCode;
  final UpdateTbWhCmCode updateTbWhCmCode;
  final DeleteTbWhCmCode deleteTbWhCmCode;
  final DeleteTbWhCmCodeAll deleteTbWhCmCodeAll;

  UseCaseTbCmCode({
    required this.getTbWhCmCodeList,
    required this.selectTbWhCmCodeListByGrpCd,
    required this.selectTbWhCmCodeListByCodeCd,
    required this.insertTbWhCmCode,
    required this.updateTbWhCmCode,
    required this.deleteTbWhCmCode,
    required this.deleteTbWhCmCodeAll,
  });
}

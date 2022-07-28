
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';

abstract class CmCodeRcvRepoApi {

  Future<Result<List<TbWhCmCode>>> selectCmCodeListAll();
  Future<Result<List<TbWhCmCode>>> selectCmCodeListByCodeCd(TbWhCmCode tbWhCmCode);
  Future<Result<List<TbWhCmCode>>> selectCmCodeListByGrpCd(TbWhCmCode tbWhCmCode);
  Future<Result<String>> getPDAVersion();
}
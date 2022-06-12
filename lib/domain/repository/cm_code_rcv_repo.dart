
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';

abstract class CmCodeRcvRepo {
  Future<Result<List<TbWhCmCode>>> selectCmCodeList(String query);
}
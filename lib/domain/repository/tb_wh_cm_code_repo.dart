import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';

abstract class TbWhCmCodeRepo {
  //리스트 조회
  Future<Result<List<TbWhCmCode>>> getTbWhCmCodeList();

  Future<Result<List<TbWhCmCode>>> selectTbWhCmCodeListByGrpCd(
      TbWhCmCode tbWhCmCode);

  Future<Result<List<TbWhCmCode>>> selectTbWhCmCodeListByCodeCd(
      TbWhCmCode tbWhCmCode);

  Future<Result<bool>> insertTbWhCmCode(TbWhCmCode tbWhCmCode);

  Future<Result<bool>> updateTbWhCmCode(TbWhCmCode tbWhCmCode);

  Future<Result<bool>> deleteTbWhCmCode(TbWhCmCode tbWhCmCode);

  Future<Result<bool>> deleteTbWhCmCodeAll();

  Future<Result<bool>> deleteAndInsertTbWhCmCodeBatch(List<TbWhCmCode> tbWhCmCode );
}

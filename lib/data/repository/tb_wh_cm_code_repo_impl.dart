import 'package:kdlwms/data/data_source/result.dart';

import 'package:kdlwms/data/data_source/tb_wh_cm_code_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

import '../../kdl_common/common_functions.dart';

class TbWhCmCodeRepoImpl implements TbWhCmCodeRepo {

  final TbWhCmCodeDbHelper db;

  TbWhCmCodeRepoImpl(this.db);

  @override
  Future<Result<List<TbWhCmCode>>> getTbWhCmCodeList() async {
    return await db.getTbWhCmCodeList();
  }

  @override
  Future<Result<bool>> insertTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    return await db.insertTbWhCmCode(tbWhCmCode);
  }

  @override
  Future<Result<bool>> updateTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    return await db.updateTbWhCmCode(tbWhCmCode);
  }

  @override
  Future<Result<bool>> deleteTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    return await db.deleteTbWhCmCode(tbWhCmCode);
  }

  @override
  Future<Result<bool>> deleteTbWhCmCodeAll() async {
    return await db.deleteTbWhCmCodeAll();
  }


  @override
  Future<Result<List<TbWhCmCode>>> selectTbWhCmCodeListByCodeCd(TbWhCmCode tbWhCmCode) async {
    return await db.selectTbWhCmCodeListByCodeCd(tbWhCmCode);
  }

  @override
  Future<Result<List<TbWhCmCode>>> selectTbWhCmCodeListByGrpCd(TbWhCmCode tbWhCmCode)async {
    return await db.selectTbWhCmCodeListByGrpCd(tbWhCmCode);
  }

  @override
  Future<Result<bool>> deleteAndInsertTbWhItemBatch(List<TbWhCmCode> tbWhCmCodes) async {

    Result result = await deleteTbWhCmCodeAll();
    result.when(success: (value) async {
      int nOkCnt = 0;
      int nTotalCnt = tbWhCmCodes.length;
      for (TbWhCmCode tbWhItem in tbWhCmCodes) {
        Result resultInsert = await db.insertTbWhCmCode(tbWhItem);
        resultInsert.when(success: (value) {
        }, error: (message) {
          return Result.error(message);
        });
        nOkCnt = nOkCnt + 1;
      }
      writeLog('총 $nTotalCnt 건:  / 성공: $nOkCnt 건');

      return Result.success(value);
    }, error: (message) {
      return Result.error(message);
    });
    return const Result.success(true);
  }
}
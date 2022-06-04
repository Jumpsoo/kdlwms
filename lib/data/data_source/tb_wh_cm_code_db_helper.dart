import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:sqflite/sqflite.dart';

class TbWhCmCodeDbHelper {
  Database db;

  TbWhCmCodeDbHelper(this.db);

  Future<Result<List<TbWhCmCode>>> getTbWhCmCodeList() async {
    try {
      final maps = await db.query(
        'TB_WH_CM_CODE',
      );
      return Result.success(maps.map((e) => TbWhCmCode.fromJson(e)).toList());
    } catch (e) {
      return const Result.error('데이터베이스 에러');
    }
  }

  Future<Result<bool>> updateTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    try {
      await db.update(
        'TB_WH_CM_CODE',
        tbWhCmCode.toJson(),
        where: 'CODE_ID = ? ',
        whereArgs: [tbWhCmCode],
      );
      return const Result.success(true);
    } catch (e) {
      return const Result.error('데이터베이스 에러');
    }
  }

  Future<Result<bool>> insertTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    try {
      int retVal = await db.insert('TB_WH_CM_CODE', tbWhCmCode.toJson());


      if(retVal == 0) {
        return const Result.success(true);
      }else{
        return const Result.error('데이터베이스 에러');
      }
    } catch (e) {
      return const Result.error('데이터베이스 에러');
    }
  }

  Future<Result<bool>> deleteTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    try {
      await db.delete(
        'TB_WH_CM_CODE',
        where: 'CODE_ID = ? ',
        whereArgs: [tbWhCmCode.CODE_ID],
      );
      return const Result.success(true);
    } catch (e) {
      return const Result.error('데이터베이스 에러');
    }
  }

  Future<Result<bool>> deleteTbWhCmCodeAll() async {
    try {
      await db.delete(
        'TB_WH_CM_CODE',
      );
      return const Result.success(true);
    } catch (e) {
      print('데이터베이스 에러');
      return Result.error('데이터베이스 에러');
    }
  }
}

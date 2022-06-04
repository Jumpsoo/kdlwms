import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:sqflite/sqflite.dart';

class TbCmSyncDbHelper {
  Database db;

  TbCmSyncDbHelper(this.db);

  Future<Result<List<TbCmSync>?>> getTbCmSyncList() async {
    try {
      final maps = await db.query(
        'TB_CM_SYNC',
      );
      return Result.success(maps.map((e) => TbCmSync.fromJson(e)).toList());
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> updateTbCmSync(TbCmSync tbCmSync) async {
    try {
      await db.update(
        'TB_CM_SYNC',
        tbCmSync.toJson(),
        where: 'VERSION_CODE = ? ',
        whereArgs: [tbCmSync.VERSION_CODE],
      );
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> insertTbCmSync(TbCmSync tbCmSync) async {
    try {
      await db.insert('TB_CM_SYNC', tbCmSync.toJson());
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> deleteTbCmSync(TbCmSync tbCmSync) async {
    try {
      await db.delete(
        'TB_CM_SYNC',
        where: 'VERSION_CODE = ? ',
        whereArgs: [tbCmSync.VERSION_CODE],
      );
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> deleteTbCmSyncAll() async {
    try {
      await db.delete(
        'TB_CM_SYNC',
      );
      return Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}

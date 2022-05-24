
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:sqflite/sqflite.dart';

class TbCmSyncDbHelper{

  Database db;
  TbCmSyncDbHelper(this.db);

  Future<List<TbCmSync>?> getTbCmSyncList() async {
    final maps = await db.query(
      'TB_CM_SYNC',
    );
    if (maps.isNotEmpty) {
      return maps.map((e) => TbCmSync.fromJson(e)).toList();
    }
    return null;
  }

  Future<bool> updateTbCmSync(TbCmSync tbCmSync) async {
    try {
      await db.update(
        'TB_CM_SYNC',
        tbCmSync.toJson(),
        where: 'VERSION_CODE = ? ',
        whereArgs: [tbCmSync.VERSION_CODE],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> insertTbCmSync(TbCmSync tbCmSync) async {
    try {
      await db.insert('TB_CM_SYNC', tbCmSync.toJson());
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> deleteTbCmSync(TbCmSync tbCmSync) async {
    try {
      await db.delete(
        'TB_CM_SYNC',
        where: 'VERSION_CODE = ? ',
        whereArgs: [tbCmSync.VERSION_CODE],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

}
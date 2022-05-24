
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:sqflite/sqflite.dart';

class TbCmLocationDbHelper{

  Database db;
  TbCmLocationDbHelper(this.db);

  Future<List<TbCmLocation>?> getTbCmLocationList() async {
    final maps = await db.query(
    'TB_CM_LOCATION',
    );

    if (maps.isNotEmpty) {
    return maps.map((e) => TbCmLocation.fromJson(e)).toList();
    }
    return null;
  }

  Future<bool> updateTbCmLocation(TbCmLocation tbCmLocation) async {
    try {
      await db.update(
        'TB_CM_LOCATION',
        tbCmLocation.toJson(),
        where: 'WORKSHOP = ? AND LOCATION = ? ',
        whereArgs: [tbCmLocation.WORKSHOP, tbCmLocation.LOCATION],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> insertTbCmLocation(TbCmLocation tbCmLocation) async {
    try {
      await db.insert('TB_CM_LOCATION', tbCmLocation.toJson());
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> deleteTbCmLocation(TbCmLocation tbCmLocation) async {
    try {
      await db.delete(
        'TB_CM_LOCATION',
        where: 'WORKSHOP = ? AND LOCATION = ? ',
        whereArgs: [tbCmLocation.WORKSHOP, tbCmLocation.LOCATION],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

}
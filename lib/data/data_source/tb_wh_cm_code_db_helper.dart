import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:sqflite/sqflite.dart';

class TbWhCmCodeDbHelper{

  Database db;
  TbWhCmCodeDbHelper(this.db);

  Future<List<TbWhCmCode>?> getTbWhCmCodeList() async {
    final maps = await db.query(
      'TB_WH_CM_CODE',
    );

    if (maps.isNotEmpty) {
      return maps.map((e) => TbWhCmCode.fromJson(e)).toList();
    }
    return null;
  }

  Future<bool> updateTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    try {
      await db.update(
        'TB_WH_CM_CODE',
        tbWhCmCode.toJson(),
        where: 'CODE_ID = ? ',
        whereArgs: [tbWhCmCode],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> insertTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    try {
      await db.insert('TB_WH_CM_CODE', tbWhCmCode.toJson());
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> deleteTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    try {
      await db.delete(
        'TB_WH_CM_CODE',
        where: 'CODE_ID = ? ',
        whereArgs: [tbWhCmCode.CODE_ID],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

}
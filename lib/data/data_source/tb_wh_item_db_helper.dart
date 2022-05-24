
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:sqflite/sqflite.dart';

class TbWhItemDbHelper{

  Database db;
  TbWhItemDbHelper(this.db);

  Future<List<TbWhItem>?> getTbWhItemList() async {
    final maps = await db.query(
      'TB_WH_ITEM',
    );

    if (maps.isNotEmpty) {
      return maps.map((e) => TbWhItem.fromJson(e)).toList();
    }
    return null;
  }

  Future<bool> updateTbWhItem(TbWhItem tbWhItem) async {
    try {
      await db.update(
        'TB_WH_ITEM',
        tbWhItem.toJson(),
        where: 'ITEM_NO = ?',
        whereArgs: [tbWhItem.ITEM_NO],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> insertTbWhItem(TbWhItem tbWhItem) async {
    try {
      await db.insert('TB_WH_ITEM', tbWhItem.toJson());
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> deleteTbWhItem(TbWhItem tbWhItem) async {
    try {
      await db.delete(
        'TB_WH_ITEM',
        where: 'ITEM_NO = ? ',
        whereArgs: [tbWhItem.ITEM_NO],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

}
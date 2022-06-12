import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:sqflite/sqflite.dart';

class TbWhItemDbHelper {
  Database db;

  TbWhItemDbHelper(this.db);

  Future<Result<List<TbWhItem>?>> getTbWhItemList() async {
    try {
      final maps = await db.query(
        'TB_WH_ITEM',
      );
      return Result.success(maps.map((e) => TbWhItem.fromJson(e)).toList());
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> updateTbWhItem(TbWhItem tbWhItem) async {
    try {
      await db.update(
        'TB_WH_ITEM',
        tbWhItem.toJson(),
        where: 'itemNo = ?',
        whereArgs: [tbWhItem.itemNo],
      );
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> insertTbWhItem(TbWhItem tbWhItem) async {
    try {
      await db.insert('TB_WH_ITEM', tbWhItem.toJson());
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> deleteTbWhItem(TbWhItem tbWhItem) async {
    try {
      await db.delete(
        'TB_WH_ITEM',
        where: 'itemNo = ? ',
        whereArgs: [tbWhItem.itemNo],
      );
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> deleteTbWhItemAll() async {
    try {
      await db.delete(
        'TB_WH_ITEM',
      );
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}

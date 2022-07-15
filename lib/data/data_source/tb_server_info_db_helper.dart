
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_server_info.dart';
import 'package:sqflite/sqflite.dart';

class TbServerInfoDbHelper {
  Database db;

  TbServerInfoDbHelper(this.db);

  Future<Result<TbServerInfo?>> selectTbServerInfo() async {
    try {
      final maps = await db.query(
        'TB_SERVER_INFO',
      );
      print(maps.map((e) => TbServerInfo.fromJson(e)).toList());
      return Result.success(maps.map((e) => TbServerInfo.fromJson(e)).toList()[0]);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> mergeTbServerInfo(TbServerInfo tbServerInfo) async {
    try {
      await deleteTbServerInfoAll();
      await db.insert('TB_SERVER_INFO', tbServerInfo.toJson());

      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> deleteTbServerInfoAll() async {
    try {
      await db.delete(
        'TB_SERVER_INFO',
      );
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:sqflite/sqflite.dart';

class TbCmLocationDbHelper {
  Database db;

  TbCmLocationDbHelper(this.db);

  Future<Result<List<TbCmLocation>?>> selectTbCmLocationList(
      TbCmLocation tbCmLocation) async {
    try {
      final maps = await db.query(
        'TB_CM_LOCATION',
        where: 'workshop = ? AND location = ? ',
        whereArgs: [tbCmLocation.workshop, tbCmLocation.location],
      );

      return Result.success(maps.map((e) => TbCmLocation.fromJson(e)).toList());
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<List<TbCmLocation>?>> selectTbCmLocationListAll() async {
    try {
      final maps = await db.query(
        'TB_CM_LOCATION',
      );
      return Result.success(maps.map((e) => TbCmLocation.fromJson(e)).toList());
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<TbCmLocation?>> selectTbCmLocationCurrentItem() async {
    try {
      final maps = await db.query(
        'TB_CM_LOCATION',
        where: 'setFlag = ? ',
        whereArgs: ['Y'],
      );
      return Result.success(
          maps.map((e) => TbCmLocation.fromJson(e)).toList()[0]);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> updateTbCmLocation(TbCmLocation tbCmLocation) async {
    try {
      await db.update(
        'TB_CM_LOCATION',
        tbCmLocation.toJson(),
        where: 'workshop = ? AND location = ? ',
        whereArgs: [tbCmLocation.workshop, tbCmLocation.location],
      );
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  //키값을 받은 뒤 조회 후 set_flag 만 변경
  Future<Result<bool>> updateFromSelectTbCmLocationToEnable(
      String sWorkShop) async {
    try {
      final maps = await db.query(
        'TB_CM_LOCATION',
        where: 'workshop = ? ',
        whereArgs: [sWorkShop],
      );

      List<TbCmLocation> retList =
          maps.map((e) => TbCmLocation.fromJson(e)).toList();
      if (retList.isEmpty) {
        return const Result.error('수정 할 데이터가 없습니다.');
      }
      for (TbCmLocation item in retList) {
        item = item.copyWith(setFlag: 'Y');
        await db.update(
          'TB_CM_LOCATION',
          item.toJson(),
          where: 'workshop = ? AND location = ? ',
          whereArgs: [item.workshop, item.location],
        );
      }
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  //키값을 받은 뒤 조회 후 set_flag 만 변경
  Future<Result<bool>> updateFromSelectTbCmLocationToDisableAll() async {
    try {
      final maps = await db.query(
        'TB_CM_LOCATION',
      );
      List<TbCmLocation> retList =
          maps.map((e) => TbCmLocation.fromJson(e)).toList();
      if (retList.isEmpty) {
        return const Result.error('수정 할 데이터가 없습니다.');
      }

      for (TbCmLocation item in retList) {
        item = item.copyWith(setFlag: 'N');
        await db.update(
          'TB_CM_LOCATION',
          item.toJson(),
          where: 'workshop = ? AND location = ? ',
          whereArgs: [item.workshop, item.location],
        );
      }
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> insertTbCmLocation(TbCmLocation tbCmLocation) async {
    try {
      await db.insert('TB_CM_LOCATION', tbCmLocation.toJson());
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> deleteTbCmLocation(TbCmLocation tbCmLocation) async {
    try {
      await db.delete(
        'TB_CM_LOCATION',
        where: 'workshop = ? AND location = ? ',
        whereArgs: [tbCmLocation.workshop, tbCmLocation.location],
      );
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> deleteTbCmLocationAll(String setFlag) async {
    try {
      await db.delete(
        'TB_CM_LOCATION',
        where: 'setFlag = ?',
        whereArgs: [setFlag],
      );
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> upsertTbCmLocation(TbCmLocation tbCmLocation) async {
    try {
      final maps = await db.query('TB_CM_LOCATION',
          where: 'workshop = ? ', whereArgs: [tbCmLocation.workshop]);

      if (maps.map((e) => TbCmLocation.fromJson(e)).toList().isNotEmpty) {
        //상태값은 그대로 둬야한다.
        await db.rawQuery(
            'UPDATE TB_CM_LOCATION  '
            'SET  workshopNm = ?, syncDateTime = ?'
            ' WHERE workshop = ?',
            [
              tbCmLocation.workshopNm,
              tbCmLocation.syncDateTime,
              tbCmLocation.workshop,
            ]);

        await db.update(
          'TB_CM_LOCATION',
          tbCmLocation.toJson(),
          where: 'workshop = ?',
          whereArgs: [tbCmLocation.workshop],
        );
      } else {
        await db.insert('TB_CM_LOCATION', tbCmLocation.toJson());
      }
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}

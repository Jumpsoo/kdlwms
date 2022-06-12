import 'dart:ui';

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
        where: 'WORKSHOP = ? AND LOCATION = ? ',
        whereArgs: [tbCmLocation.WORKSHOP, tbCmLocation.LOCATION],
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
        where: 'SET_FLAG = ?  ',
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
        where: 'WORKSHOP = ? AND LOCATION = ? ',
        whereArgs: [tbCmLocation.WORKSHOP, tbCmLocation.LOCATION],
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
        where: 'WORKSHOP = ? ',
        whereArgs: [sWorkShop],
      );

      List<TbCmLocation> retList =
          maps.map((e) => TbCmLocation.fromJson(e)).toList();
      if (retList.isEmpty) {
        return const Result.error('수정 할 데이터가 없습니다.');
      }
      for (TbCmLocation item in retList) {
        item = item.copyWith(SET_FLAG: 'Y');
        await db.update(
          'TB_CM_LOCATION',
          item.toJson(),
          where: 'WORKSHOP = ? AND LOCATION = ? ',
          whereArgs: [item.WORKSHOP, item.LOCATION],
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
        item = item.copyWith(SET_FLAG: 'N');
        await db.update(
          'TB_CM_LOCATION',
          item.toJson(),
          where: 'WORKSHOP = ? AND LOCATION = ? ',
          whereArgs: [item.WORKSHOP, item.LOCATION],
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
        where: 'WORKSHOP = ? AND LOCATION = ? ',
        whereArgs: [tbCmLocation.WORKSHOP, tbCmLocation.LOCATION],
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
        where: 'SET_FLAG = ?',
        whereArgs: [setFlag],
      );
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> upsertTbCmLocation(List<TbCmLocation> insertList) async {
    try {

      for (TbCmLocation insertItem in insertList) {
        final maps = await db.query(
          'TB_CM_LOCATION',
          where: 'WORKSHOP = ? AND LOCATION = ? ',
          whereArgs: [insertItem.WORKSHOP, insertItem.LOCATION],
        );
        if (maps.map((e) => TbCmLocation.fromJson(e)).toList().isNotEmpty) {
          print('update : $insertItem');
          await db.update(
            'TB_CM_LOCATION',
            insertItem.toJson(),
            where: 'WORKSHOP = ? AND LOCATION = ? ',
            whereArgs: [insertItem.WORKSHOP, insertItem.LOCATION],
          );
        } else {
          print('insert : $insertItem');
          await db.insert('TB_CM_LOCATION', insertItem.toJson());

        }
      }
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}

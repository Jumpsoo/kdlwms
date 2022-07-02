import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_load.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:sqflite/sqflite.dart';

class TbWhPalletLoadDbHelper {
  Database db;

  TbWhPalletLoadDbHelper(this.db);

  //상차대상 항목(완료, 상차중) 항목 표시
  //상태값이 1, 2인 항목만 보여줄것
  //그루핑 리스트
  Future<Result<List<TbWhPalletLoadGroup>?>> selectLoadingSummary(
      TbWhPalletLoad tbWhPalletLoad) async {
    try {
      final maps1 = await db.rawQuery(
          'select "합계" as itemNo, " " as itemLot, sum(quantity) as quantity, count(*) as boxCnt '
          ' from TB_WH_PALLET_LOAD '
          ' where comps = ? '
          '   and workshop = ? '
          '   and location = ?',
          [
            tbWhPalletLoad.comps!,
            tbWhPalletLoad.workshop!,
            tbWhPalletLoad.location!,
          ]);
      final maps2 = await db.rawQuery(
          'SELECT itemNo, itemLot, sum(quantity) as quantity, count(*) as boxCnt '
          ' from TB_WH_PALLET_LOAD '
          ' where comps = ? '
          '   and workshop = ? '
          '   and location = ?'
          ' group by comps, workshop, location, itemNo, itemLot ',
          [
            tbWhPalletLoad.comps,
            tbWhPalletLoad.workshop,
            tbWhPalletLoad.location,
          ]);
      final mapRet = {...maps1, ...maps2};
      return Result.success(
          mapRet.map((e) => TbWhPalletLoadGroup.fromJson(e)).toList());
    } catch (_) {
      var sErrMsg = "데이터베이스 에러발생 : selectLoadingSummary(Qry)";
      writeLog(sErrMsg);
      return Result.error(sErrMsg);
    }
  }

  //04. 상차완료 하단 조회
  //상차전인 항목 표시
  //상태값이 0, 1인 항목만 보 여줄것
  Future<Result<List<TbWhPalletLoad>?>> selectLoadingList(
      TbWhPalletLoad tbWhPalletLoad) async {
    try {
      final maps = await db.query(
        'TB_WH_PALLET_LOAD',
        where: 'comps = ? '
            'and workshop = ? '
            'and location = ?',
        whereArgs: [
          tbWhPalletLoad.comps,
          tbWhPalletLoad.workshop,
          tbWhPalletLoad.location,
        ],
        orderBy: 'palletSeq ASC',
      );
      return Result.success(
          maps.map((e) => TbWhPalletLoad.fromJson(e)).toList());
    } catch (_) {
      var sErrMsg = "데이터베이스 에러발생 : selectLoadingList(Qry)";
      writeLog(sErrMsg);
      return Result.error(sErrMsg);
    }
  }

  //상차완료 후 삭제
  Future<Result<bool>> deleteTbWhPalletLoad(TbWhPalletLoad pallet) async {
    try {
      int nRet = await db.delete(
        'TB_WH_PALLET_LOAD',
        where: 'comps =? and workshop = ? and location = ? and barcode = ?',
        whereArgs: [
          pallet.comps,
          pallet.workshop,
          pallet.location,
          pallet.barcode
        ],
      );
      if(nRet == 0){
        writeLog('삭제실패 : 조건 불일치');
        return Result.error('삭제실패 : 조건 불일치');
      }
    } catch (_) {
      var sErrMsg = "데이터베이스 에러발생 : deleteTbWhPalletLoad(Qry)";
      writeLog(sErrMsg);
      return Result.error(sErrMsg);
    }
    return const Result.success(true);
  }

  ///라벨 발행화면에서 데이터 이관시 사용
  Future<Result<bool>> upsertPalletLoad(TbWhPalletLoad pallet) async {
    try {
      final maps = await db.query(
        'TB_WH_PALLET_LOAD',
        where: 'barcode = ?',
        whereArgs: [pallet.barcode],
      );

      if (maps.map((e) => TbWhPalletLoad.fromJson(e)).toList().isNotEmpty) {
        await db.update(
          'TB_WH_PALLET_LOAD',
          pallet.toJson(),
          where: 'barcode = ?',
          whereArgs: [pallet.barcode],
        );
      } else {
        await db.insert('TB_WH_PALLET_LOAD', pallet.toJson());
      }
    } catch (_) {
      var sErrMsg = "데이터베이스 에러발생 : upsertPalletLoad(Qry)";
      writeLog(sErrMsg);
      return Result.error(sErrMsg);
    }
    return const Result.success(true);
  }
  
  Future<Result<int>> getTbWhPalletLoadCountInDevice() async {
    try{
      int count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) '
            'FROM TB_WH_PALLET_LOAD '),
      )!;
      return Result.success(count);
    }catch(e){
      var sErrMsg = '데이터베이스 에러 : getTbWhPalletLoadCountInDevice(qry)';
      writeLog(sErrMsg);
      return Result.error(sErrMsg);
    }
  }

  Future<Result<bool>> deleteTbWhPalletLoadAll() async {
    try {
      await db.delete(
        'TB_WH_PALLET_LOAD',
      );
      return Result.success(true);
    } catch (e) {
      var sErrMsg = '데이터베이스 에러 : deleteTbWhPalletLoadAll(qry)';
      writeLog(sErrMsg);
      return Result.error(sErrMsg);
    }
  }
}

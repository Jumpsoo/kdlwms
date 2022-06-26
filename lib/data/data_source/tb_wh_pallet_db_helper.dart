import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:sqflite/sqflite.dart';

class TbWhPalletDbHelper {
  Database db;

  TbWhPalletDbHelper(this.db);

  //01. 실적입력 상단집계
  //상차전인 항목 표시
  //상태값이 0, 1인 항목만 보 여줄것
  //그루핑 리스트
  Future<List<TbWhPalletGroup>?> selectPackingSummary(
      TbWhPallet tbWhPallet) async {
    final maps1 = await db.rawQuery(
        'select "합계" as itemNo, " " as itemLot, sum(quantity) as quantity, count(*) as boxCnt '
        ' from TB_WH_PALLET '
        ' where comps = ? '
        '   and workshop = ? '
        '   and location = ?'
        '   and state <=  ? ',
        [
          tbWhPallet.comps!,
          tbWhPallet.workshop!,
          tbWhPallet.location!,
          LoadState.Confirm.index,
        ]);
    final maps2 = await db.rawQuery(
        'SELECT itemNo, itemLot, sum(quantity) as quantity, count(*) as boxCnt '
        ' from TB_WH_PALLET '
        ' where comps = ? '
        '   and workshop = ? '
        '   and location = ?'
        '   and state <=  ? '
        ' group by comps, workshop, location, itemNo, itemLot ',
        [
          tbWhPallet.comps!,
          tbWhPallet.workshop!,
          tbWhPallet.location!,
          LoadState.Confirm.index,
        ]);
    final mapRet = {...maps1, ...maps2};
    return mapRet.map((e) => TbWhPalletGroup.fromJson(e)).toList();
  }

  //01. 실적입력 01-02. 하단
  //상차전인 항목 표시
  //상태값이 0, 1인 항목만 보 여줄것
  Future<List<TbWhPallet>?> selectPackingList(TbWhPallet tbWhPallet) async {
    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'comps = ? '
          'and workshop = ? '
          'and location = ?'
          'and state <=  ? ',
      whereArgs: [
        tbWhPallet.comps,
        tbWhPallet.workshop,
        tbWhPallet.location,
        LoadState.Confirm.index,
      ],
      orderBy: 'palletSeq ASC',
    );
    return maps.map((e) => TbWhPallet.fromJson(e)).toList();
  }

  //02. 실적조회 상단집계
  //상차전인 항목 표시
  //상태값 전체다 보여줄것
  Future<List<TbWhPalletGroup>?> selectPalletingSummary(
      TbWhPallet tbWhPallet) async {
    final maps1 = await db.rawQuery(
        'select "합계" as itemNo, " " as itemLot, sum(quantity) as quantity, count(*) as boxCnt '
        ' from TB_WH_PALLET '
        ' where comps = ? '
        '   and workshop = ? '
        '   and location = ?',
        [
          tbWhPallet.comps!,
          tbWhPallet.workshop!,
          tbWhPallet.location!,
        ]);

    final maps2 = await db.rawQuery(
        'SELECT itemNo, itemLot, sum(quantity) as quantity, count(*) as boxCnt '
        ' from TB_WH_PALLET '
        ' where comps = ? '
        '   and workshop = ? '
        '   and location = ?'
        ' group by comps, workshop, location, itemNo, itemLot ',
        [
          tbWhPallet.comps!,
          tbWhPallet.workshop!,
          tbWhPallet.location!,
        ]);
    final mapRet = {...maps1, ...maps2};
    return mapRet.map((e) => TbWhPalletGroup.fromJson(e)).toList();
  }

  //02. 실적조회 하단 조회
  //상차전인 항목 표시
  //상태값 전체다 보여줄것
  Future<List<TbWhPallet>?> selectPalletingList(TbWhPallet tbWhPallet) async {
    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'comps = ? '
          'and workshop = ? '
          'and location = ?' ,
      whereArgs: [
        tbWhPallet.comps,
        tbWhPallet.workshop,
        tbWhPallet.location,
      ],
      orderBy: 'itemLot, itemNo, state ',
    );
    return maps.map((e) => TbWhPallet.fromJson(e)).toList();
  }

  //02. 실적조회 화면 쿼리
  // 작업위치별 실적 리스트 조회
  Future<List<TbWhPallet>?> selectTbWhPalletListByLocation(
      TbWhPallet tbWhPallet) async {

    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'comps = ? and workshop = ? and location = ?',
      whereArgs: [tbWhPallet.comps, tbWhPallet.workshop, tbWhPallet.location],
      orderBy: 'state, itemNo, itemLot ASC',
    );
    return maps.map((e) => TbWhPallet.fromJson(e)).toList();
  }

  //03. 인쇄 대상 조회
  // 입력된 실적 확인
  // 어디에 입력되었는지도 알려주면 좋을거같다.
  Future<List<TbWhPalletGroup>?> selectPrintingList(
      TbWhPallet tbWhPallet) async {

    final maps = await db.rawQuery(
        'SELECT palletSeq, itemNo, itemLot, sum(quantity) as quantity, count(*) as boxCnt '
            ' from TB_WH_PALLET '
            ' where comps = ? '
            '   and workshop = ? '
            '   and location = ?'
            ' group by comps, workshop, location, palletSeq, itemNo, itemLot ',
        [
          tbWhPallet.comps,
          tbWhPallet.workshop,
          tbWhPallet.location,
        ]);
    print(maps);
    return maps.map((e) => TbWhPalletGroup.fromJson(e)).toList();

  }

  //04. 상차완료 상단 조회
  //상차대상 항목(완료, 상차중) 항목 표시
  //상태값이 1, 2인 항목만 보여줄것
  //그루핑 리스트
  Future<List<TbWhPalletGroup>?> selectLoadingSummary(
      TbWhPallet tbWhPallet) async {
    final maps1 = await db.rawQuery(
        'select "합계" as itemNo, " " as itemLot, sum(quantity) as quantity, count(*) as boxCnt '
        ' from TB_WH_PALLET '
        ' where comps = ? '
        '   and workshop = ? '
        '   and location = ?'
        '   and state >=  ? ',
        [
          tbWhPallet.comps!,
          tbWhPallet.workshop!,
          tbWhPallet.location!,
          LoadState.Confirm.index,
        ]);
    final maps2 = await db.rawQuery(
        'SELECT itemNo, itemLot, sum(quantity) as quantity, count(*) as boxCnt '
        ' from TB_WH_PALLET '
        ' where comps = ? '
        '   and workshop = ? '
        '   and location = ?'
        '   and state >=  ? '
        ' group by comps, workshop, location, itemNo, itemLot ',
        [
          tbWhPallet.comps,
          tbWhPallet.workshop,
          tbWhPallet.location,
          LoadState.Confirm.index,
        ]);
    final mapRet = {...maps1, ...maps2};
    return mapRet.map((e) => TbWhPalletGroup.fromJson(e)).toList();
  }

  //04. 상차완료 하단 조회
  //상차전인 항목 표시
  //상태값이 0, 1인 항목만 보 여줄것
  Future<List<TbWhPallet>?> selectLoadingList(TbWhPallet tbWhPallet) async {
    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'comps = ? '
          'and workshop = ? '
          'and location = ?'
          'and state >=  ? ',
      whereArgs: [
        tbWhPallet.comps,
        tbWhPallet.workshop,
        tbWhPallet.location,
        LoadState.Confirm.index,
      ],
      orderBy: 'palletSeq ASC',
    );
    return maps.map((e) => TbWhPallet.fromJson(e)).toList();
  }

  // 단일행 조회 (서버전송용 정보 재조회)
  Future<Result<TbWhPallet?>> selectTbWhPalletInto(
      TbWhPallet tbWhPallet) async {
    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'comps = ? and barcode = ?',
      whereArgs: [tbWhPallet.comps, tbWhPallet.barcode],
    );
    if (maps.map((e) => TbWhPallet.fromJson(e)).toList().isNotEmpty) {
      return Result.success(
          maps.map((e) => TbWhPallet.fromJson(e)).toList()[0]);
    } else {
      return Result.error('No Data found');
    }
  }

  // 입력된 실적 확인
  // 어디에 입력되었는지도 알려주면 좋을거같다.
  Future<List<TbWhPallet>?> selectDupleCheck(String sBarCode) async {
    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'BARCODE = ? ',
      whereArgs: [sBarCode],
    );
    if (maps.isNotEmpty) {
      return maps.map((e) => TbWhPallet.fromJson(e)).toList();
    }
    return null;
  }

  Future<bool> insertTbWhPallet(TbWhPallet pallet) async {
    try {
      await db.insert('TB_WH_PALLET', pallet.toJson());
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> updateTbWhPallet(TbWhPallet pallet) async {
    try {
      await db.update(
        'TB_WH_PALLET',
        pallet.toJson(),
        where: 'comps = ? and palletSeq = ? and boxNo = ?',
        whereArgs: [pallet.comps, pallet.palletSeq, pallet.boxNo],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<Result<bool>> updateTbWhPalletState(TbWhPallet pallet) async {
    Result result;

    try {
      await db.update(
        'TB_WH_PALLET',
        pallet.toJson(),
        where: 'comps = ? and barcode = ? ',
        whereArgs: [pallet.comps, pallet.barcode],
      );
    } catch (e) {
      return Result.error(e.toString());
    }
    return const Result.success(true);
  }

  Future<bool> deleteTbWhPallet(TbWhPallet pallet) async {
    try {
      int nRet = await db.delete(
        'TB_WH_PALLET',
        where: 'barcode = ?',
        whereArgs: [pallet.barcode],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> deleteTbWhPalletAll() async {
    try {
      await db.delete(
        'TB_WH_PALLET',
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<Result<bool>> upsertPallet(TbWhPallet pallet) async {
    try {
      final maps = await db.query(
        'TB_WH_PALLET',
        where: 'barcode = ?',
        whereArgs: [pallet.barcode],
      );

      if (maps.map((e) => TbWhPallet.fromJson(e)).toList().isNotEmpty) {
        await db.update(
          'TB_WH_PALLET',
          pallet.toJson(),
          where: 'barcode = ?',
          whereArgs: [pallet.barcode],
        );
      } else {
        await db.insert('TB_WH_PALLET', pallet.toJson());
      }
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<int> getTbWhPalletCountInDevice() async {
    int count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) '
          'FROM TB_WH_PALLET '),
    )!;
    return count;
  }

  // 01. 기실적여부 체크
  // 02. 품번 유효성 체크
  Future<Result<bool>> selectCheckValue(TbWhPallet pallet) async {
    int? count = Sqflite.firstIntValue(await db.rawQuery(
        'SELECT COUNT(*) '
        ' FROM TB_WH_PALLET '
        'WHERE barcode = ?',
        [
          pallet.barcode,
        ]));

    if (count != null && count > 0) {
      return const Result.error('이미 입력한 식별표 입니다.');
    }

    count = Sqflite.firstIntValue(await db.rawQuery(
        'SELECT COUNT(*) '
        'FROM TB_WH_ITEM '
        ' WHERE itemNo = ?',
        [pallet.itemNo]));

    if (count != null && count == 0) {
      return const Result.error('품번정보가 없습니다. 동기화 또는 식별표를 확인하세요.');
    }
    return const Result.success(true);
  }

  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq) async {
    // SLEECT * FRO TB_WH_PALLET WHERE ID = 1
    final List<Map<String, dynamic>> maps = await db.query(
      'TB_WH_PALLET',
      where: 'palletSeq = ?',
      whereArgs: [palletSeq],
    );
    if (maps.isNotEmpty) {
      return TbWhPallet.fromJson(maps.first);
    } else {
      return null;
    }
  }
}

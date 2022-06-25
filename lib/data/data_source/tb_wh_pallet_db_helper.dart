import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:sqflite/sqflite.dart';

class TbWhPalletDbHelper {
  Database db;

  TbWhPalletDbHelper(this.db);

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

  //상차전인 항목 표시
  //상태값이 0, 1인 항목만 보 여줄것
  //그루핑 리스트
  Future<List<TbWhPalletGroup>?> selectTbWhPalletGroup(
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
        ' group by comps, workshop, location, itemLot ',
        [
          tbWhPallet.comps!,
          tbWhPallet.workshop!,
          tbWhPallet.location!,
          LoadState.Confirm.index,
        ]);
    final mapRet = {...maps1, ...maps2};
    return mapRet.map((e) => TbWhPalletGroup.fromJson(e)).toList();
  }

  // 단일행 조회 (서버전송용 정보 재조회)
  Future<Result<TbWhPallet?>> selectTbWhPalletInto(TbWhPallet tbWhPallet) async {

    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'comps = ? and barcode = ?',
      whereArgs: [tbWhPallet.comps, tbWhPallet.barcode],
    );
    if (maps.map((e) => TbWhPallet.fromJson(e)).toList().isNotEmpty) {
      return Result.success(maps.map((e) => TbWhPallet.fromJson(e)).toList()[0]);
    }else{
      return Result.error('No Data found');
    }
  }

  // 위치/상태별 실적 리스트 조회
  Future<List<TbWhPallet>?> selectTbWhPalletListByLocation(
      TbWhPallet tbWhPallet) async {
    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'comps = ? and workshop = ? and location = ?',
      whereArgs: [tbWhPallet.comps, tbWhPallet.workshop, tbWhPallet.location],
      orderBy: 'itemLot ASC',
    );
    return maps.map((e) => TbWhPallet.fromJson(e)).toList();
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

  // 입력된 실적 확인
  // 어디에 입력되었는지도 알려주면 좋을거같다.
  Future<List<TbWhPallet>?> selectPrintingList(int nState) async {
    // final maps = await db.query(
    //   'TB_WH_PALLET',
    //   columns:['comps','workshop','location', 'palletSeq', 'scanDate'],
    //   where: 'STATE = ? ',
    //   whereArgs: [nState],
    // );
    final maps =
        await db.rawQuery('SELECT comps, workshop, location, palletSeq '
            ' FROM TB_WH_PALLET'
            ' WHERE STATE = $nState');

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

  Result<bool> updateTbWhPalletState(TbWhPallet pallet) {
    Result result;

    try {
      final String query = ' UPDATE TB_WH_PALLET '
          ' SET state = ${pallet.state} , '
          '   palletSeq = ${pallet.palletSeq} '
          ' WHERE comps = "${pallet.comps}"  and boxNo = ${pallet.boxNo}  and itemLot = "${pallet.itemLot}"';

      writeLog(query);

      db.rawQuery(
        query,
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
        whereArgs: [
          pallet.barcode
        ],
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

    count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) '
            'FROM TB_WH_ITEM '
            ' WHERE itemNo = ?',
            [pallet.itemNo]
        ));

    print('a1');
    if (count != null && count == 0) {
      print('a2 $count');
      return const Result.error('품번정보가 없습니다. 동기화 또는 식별표를 확인하세요.');
    }
    return const Result.success(true);
  }
}

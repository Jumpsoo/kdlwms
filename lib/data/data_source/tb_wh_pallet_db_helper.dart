import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
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

  // 위치별 실적 리스트 조회
  Future<List<TbWhPallet>?> getTbWhPalletList(
      String sWorkShop, String sLocation, int nState) async {
    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'workshop = ? and state = ?',
      whereArgs: [sWorkShop, nState],
    );
    if (maps.isNotEmpty) {
      return maps.map((e) => TbWhPallet.fromJson(e)).toList();
    }
    return null;
  }


  // 입력된 실적 확인
  // 어디에 입력되었는지도 알려주면 좋을거같다.
  Future<List<TbWhPallet>?> selectDupleCheck(
      String sBarCode) async {
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
        where: 'palletSeq = ?',
        whereArgs: [pallet.palletSeq],
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> updateTbWhPalletState(TbWhPallet pallet) async {
    try {
      await db.rawQuery(
          'UPDATE TB_WH_PALLET '
              'SET state = ${pallet.state} '
              'WHERE palletSeq = ${pallet.palletSeq}');
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> deleteTbWhPallet(TbWhPallet pallet) async {
    try {
      await db.delete(
        'TB_WH_PALLET',
        where: 'palletSeq = ?',
        whereArgs: [pallet.palletSeq],
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

  Future<int> getTbWhPalletCountInDevice() async {
    int count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM TB_WH_PALLET '))!
    ;
    return count;
  }

  Future<Result<bool>> checkTbWhPalletDuplication(String sQrCode) async{
    int? count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM TB_WH_PALLET WHERE qrCode = ?', [sQrCode]));

    if(count != null && count > 0 ) {
      return const Result.error('이미 입력한 식별표 입니다.');
    }
    return const Result.success(true);
  }

}

import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:sqflite/sqflite.dart';

class TbWhPalletDbHelper {

  Database db;
  TbWhPalletDbHelper(this.db);

  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq) async {
    // SLEECT * FRO TB_WH_PALLET WHERE ID = 1
    final List<Map<String, dynamic>> maps = await db.query(
      'TB_WH_PALLET',
      where: 'PALLET_SEQ = ?',
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
      where: 'WORKSHOP = ? and STATE = ?',
      whereArgs: [sWorkShop, nState],
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
        where: 'PALLET_SEQ = ?',
        whereArgs: [pallet.PALLET_SEQ],
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
              'SET STATE = ${pallet.STATE} '
              'WHERE PALLET_SEQ = ${pallet.PALLET_SEQ}');
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> deleteTbWhPallet(TbWhPallet pallet) async {
    try {
      await db.delete(
        'TB_WH_PALLET',
        where: 'PALLET_SEQ = ?',
        whereArgs: [pallet.PALLET_SEQ],
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

}

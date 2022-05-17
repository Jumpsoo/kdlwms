import 'package:kdlwms/domain/model/pallet.dart';
import 'package:sqflite/sqflite.dart';

class PalletDbHelper {
  Database db;

  PalletDbHelper(this.db);

  Future<Pallet?> getPalletBySeq(int palletSeq) async {
    // SLEECT * FRO TB_WH_PALLET WHERE ID = 1
    final List<Map<String, dynamic>> maps = await db.query(
      'TB_WH_PALLET',
      where: 'PALLET_SEQ = ?',
      whereArgs: [palletSeq],
    );
    if (maps.isNotEmpty) {
      return Pallet.fromJson(maps.first);
    } else {
      return null;
    }
  }

  // 위치별 실적 리스트 조회
  Future<List<Pallet>?> getPalletList(
      String sWorkShop, String sLocation, int nState) async {
    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'WORKSHOP = ? and STATE = ?',
      whereArgs: [sWorkShop, nState],
    );
    if (maps.isNotEmpty) {
      return maps.map((e) => Pallet.fromJson(e)).toList();
    }
    return null;
  }

  Future<bool> insertPallet(Pallet pallet) async {
    try {
      await db.insert('TB_WH_PALLET', pallet.toJson());
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> updatePallet(Pallet pallet) async {
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

  Future<bool> updatePalletState(Pallet pallet) async {
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

  Future<bool> deletePallet(Pallet pallet) async {
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
}

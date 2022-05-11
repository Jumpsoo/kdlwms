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
    if(maps.isNotEmpty) {
      return Pallet.fromJson(maps.first);
    }else{
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
    if(maps.isNotEmpty) {
      return maps.map((e) => Pallet.fromJson(e)).toList();
    }
    return null;
  }

  Future<void> insertPallet(Pallet pallet) async {
    await db.insert('TB_WH_PALLET', pallet.toJson());
  }

  Future<void> updatePallet(Pallet pallet) async {
    await db.update(
      'TB_WH_PALLET',
      pallet.toJson(),
      where: 'PALLET_SEQ = ?',
      whereArgs: [pallet.PALLET_SEQ],
    );
  }

  Future<void> deletePallet(Pallet pallet) async {
    await db.delete(
      'TB_WH_PALLET',
      where: 'PALLET_SEQ = ?',
      whereArgs: [pallet.PALLET_SEQ],
    );
  }
}

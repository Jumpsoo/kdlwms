import 'package:kdlwms/domain/model/pallet.dart';
import 'package:sqflite/sqflite.dart';

class PalletDbHelper {
  Database db;

  PalletDbHelper(this.db);

  Future<Pallet> getPalletBySeq(int palletSeq) async {
    // SLEECT * FRO TB_WH_PALLET WHERE ID = 1
    final List<Map<String, dynamic>> maps = await db.query(
      'TB_WH_PALLET',
      where: 'PALLET_SEQ = ?',
      whereArgs: [palletSeq],
    );

    return Pallet.fromJson(maps.first);
  }

  Future<List<Pallet>> getPalletList(String workShop) async {
    // 다가저 올경우
    // final maps = await db.query('TB_WH_PALLET')

    final maps = await db.query(
      'TB_WH_PALLET',
      where: 'WORKSHOP = ?',
      whereArgs: [workShop],
    );
    return maps.map((e) => Pallet.fromJson(e)).toList();
  }

  Future<void> insertPallet(Pallet pallet) async {
    print('#####     $pallet');
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

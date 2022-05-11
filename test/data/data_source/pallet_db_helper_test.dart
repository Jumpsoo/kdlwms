import 'package:flutter_test/flutter_test.dart';
import 'package:kdlwms/data/data_source/pallet_db_helper.dart';
import 'package:kdlwms/domain/model/pallet.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('db test', () async {
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

    await db.execute('CREATE TABLE TB_WH_PALLET ( '
        'PALLET_SEQ  INTEGER PRIMARY KEY AUTOINCREMENT ,   '
        ' WORKSHOP      TEXT,       '
        ' LOCATION      TEXT,       '
        ' ITEM_NO       TEXT,       '
        ' ITEM_LOT      TEXT,       '
        ' QUANTITY      INTEGER,   '
        ' STATE         INTEGER,   '
        ' BARCODE       TEXT,       '
        ' SCAN_DATE     TIMESTAMP,  '
        ' SCAN_USERNM   TEXT,       '
        ' BOX_NO        INTEGER,   '
        ' PRINT_FLAG    TEXT,       '
        ' PRINT_DATE    TIMESTAMP,  '
        ' PRINT_USER    TEXT,       '
        ' AS400IF_FLAG  TEXT,       '
        ' AS400IF_DATE  TIMESTAMP,  '
        ' AS400IF_USER  TEXT,       '
        ' RGSTR_ID      INTEGER,   '
        ' RGST_DT       TIMESTAMP,  '
        ' UPDTR_ID      INTEGER,   '
        ' UPDT_DT       TIMESTAMP )');

    final palletDbHelper = PalletDbHelper(db);

    await palletDbHelper.insertPallet(Pallet(
      PALLET_SEQ: 1,
      WORKSHOP: 'A001',
      LOCATION: '002',
      ITEM_NO: 'Test Item',
      ITEM_LOT: 'TEST000001',
      QUANTITY: 1,
      STATE: 0,
      BARCODE: 'AAAA',
      SCAN_DATE: DateTime.now(),
      SCAN_USERNM: "MOBILE",
      BOX_NO: 999,
      PRINT_FLAG: 'Y',
      PRINT_DATE: DateTime.now(),
      PRINT_USER: 'printer',
      AS400IF_FLAG: 'Y',
      AS400IF_DATE: DateTime.now(),
      AS400IF_USER: 'as400',
      RGSTR_ID: 112220,
      RGST_DT: DateTime.now(),
      UPDTR_ID: 222999,
      UPDT_DT: DateTime.now(),
    ));

    expect((await palletDbHelper.getPalletList('A001')).length, 1);

    Pallet pallet = (await palletDbHelper.getPalletBySeq(1));
    expect(pallet.PALLET_SEQ, 1);

    await palletDbHelper.updatePallet(pallet.copyWith(
      LOCATION: 'ZZZ'
    ));
    List<Pallet> tempSaveData;
    tempSaveData = palletDbHelper.getPalletList('A001') as List<Pallet> ;
    expect(tempSaveData[0].WORKSHOP, 'A001');

    pallet = (await palletDbHelper.getPalletBySeq(1));
    expect(pallet.LOCATION, 'ZZZ');

    await palletDbHelper.deletePallet(pallet);

    expect((await palletDbHelper.getPalletList('A001')).length, 0);

    await db.close();

  });
}

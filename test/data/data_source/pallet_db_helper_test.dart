import 'package:flutter_test/flutter_test.dart';
import 'package:kdlwms/data/data_source/tb_wh_pallet_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('db test', () async {
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

    await db.execute('CREATE TABLE TB_WH_PALLET ( '
        'palletSeq  INTEGER PRIMARY KEY AUTOINCREMENT ,   '
        ' WORKSHOP      TEXT,       '
        ' LOCATION      TEXT,       '
        ' itemNo       TEXT,       '
        ' itemLot      TEXT,       '
        ' quantity      INTEGER,   '
        ' STATE         INTEGER,   '
        ' BARCODE       TEXT,       '
        ' SCAN_DATE     TIMESTAMP,  '
        ' SCAN_USERNM   TEXT,       '
        ' boxNo        INTEGER,   '
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

    final palletDbHelper = TbWhPalletDbHelper(db);
    //
    // await palletDbHelper.insertTbWhPallet(TbWhPallet(
    //   palletSeq: 1,
    //   WORKSHOP: 'A001',
    //   LOCATION: '002',
    //   itemNo: 'Test Item',
    //   itemLot: 'TEST000001',
    //   quantity: 1,
    //   STATE: 0,
    //   BARCODE: 'AAAA',
    //   SCAN_DATE: DateTime.now(),
    //   SCAN_USERNM: "MOBILE",
    //   boxNo: 999,
    //   PRINT_FLAG: 'Y',
    //   PRINT_DATE: DateTime.now(),
    //   PRINT_USER: 'printer',
    //   AS400IF_FLAG: 'Y',
    //   AS400IF_DATE: DateTime.now(),
    //   AS400IF_USER: 'as400',
    //   RGSTR_ID: 112220,
    //   RGST_DT: DateTime.now(),
    //   UPDTR_ID: 222999,
    //   UPDT_DT: DateTime.now(),
    // ));
    //
    // expect((await palletDbHelper.getTbWhPalletList('A001','002',1)!), 1);
    //
    // TbWhPallet? pallet = (await palletDbHelper.getTbWhPalletBySeq(0));
    // expect(pallet!.palletSeq, 1);
    //
    // await palletDbHelper.updateTbWhPallet(pallet.copyWith(
    //   LOCATION: 'ZZZ'
    // ));
    //
    // pallet = (await palletDbHelper.getTbWhPalletBySeq(1));
    // expect(pallet!.LOCATION, 'ZZZ');

    // await palletDbHelper.deleteTbWhPallet(pallet);

    expect((await palletDbHelper.getTbWhPalletList('A001', 'aa', 1))!.length, 0);

    await db.close();

  });
}

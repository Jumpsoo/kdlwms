
import 'package:sqflite/sqflite.dart';

Future<void> clearLocalDB() async {
  Database database = await openDatabase(
      'pallet_db1',
      version: 1,
  );
    //1. 공통코드
  await database.execute('DROP TABLE TB_WH_CM_CODE ');
  await database.execute('DROP TABLE TB_WH_ITEM ');
  await database.execute('DROP TABLE TB_CM_LOCATION ');
  await database.execute('DROP TABLE TB_WH_PALLET ');

}
import 'package:kdlwms/data/data_source/tb_wh_pallet_db_helper.dart';
import 'package:kdlwms/data/repository/tb_wh_pallet_repo_impl.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/domain/use_case/pallet/delete_pallet_all_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/get_pallet_by_seq.dart';
import 'package:kdlwms/domain/use_case/pallet/get_pallet_count_in_device.dart';

import 'package:kdlwms/domain/use_case/pallet/list_pallets_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/add_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/delete_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/update_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/update_palletstate_use_case.dart';


import 'package:kdlwms/domain/use_case/use_cases_wms.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getWmsProviders() async {
  Database database = await openDatabase(
    'pallet_db',
    version: 1,
    onCreate: (database, version) async {

      //1. 공통코드
      await database.execute('CREATE TABLE TB_WH_CM_CODE ( '
          'CODE_ID    INTEGER,'
          'GRP_CD     TEXT,'
          'CODE_CD    TEXT,'
          'CODE_KO_NM TEXT,'
          'CODE_EN_NM TEXT,'
          'CODE_JA_NM TEXT,'
          'REF_1      TEXT,'
          'REF_2      TEXT,'
          'REF_3      TEXT,'
          'REF_4      TEXT,'
          'REF_5      TEXT,'
          'CODE_ORDR  INTEGER,'
          'USE_YN     TEXT,'
          'RGSTR_ID   INTEGER,'
          'RGST_DT    TIMESTAMP,'
          'UPDTR_ID   INTEGER,'
          'UPDT_DT    TIMESTAMP ) '
      );

      //2. 품목정보
      await database.execute('CREATE TABLE TB_WH_ITEM ( '
          'ITEM_NM         TEXT,'
          'STANDARD        TEXT,'
          'QT              TEXT,'
          'ITEM_NO         TEXT,'
          'BOX_KG          INTEGER,'
          'LENGTH          INTEGER,'
          'WIDTH           INTEGER,'
          'HEIGHT          INTEGER,'
          'WAREHOUSE_CD    TEXT,'
          'WAREHOUSE_NM    TEXT,'
          'WAREHOUSE_AREA  TEXT,'
          'USE_YN          TEXT,'
          'RGSTR_ID        INTEGER,'
          'RGST_DT         TIMESTAMP,'
          'UPDTR_ID        INTEGER,'
          'UPDT_DT         TIMESTAMP )'
      );


      //3. 작업장 및 창고 정보
      await database.execute('CREATE TABLE TB_CM_LOCATION ( '
          ' WORKSHOP      TEXT,       '
          ' LOCATION      TEXT)       '
      );

      //4. 패킹정보
      await database.execute('CREATE TABLE TB_WH_PALLET ( '
          ' PALLET_SEQ  INTEGER ,   '
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
          ' UPDT_DT       TIMESTAMP )'
      );

      //5.동기화 정보( 서버 & 클라이언트), 버전, 데이터 동기화 일시
      await database.execute('CREATE TABLE TB_CM_SYNC ( '
          'VERSION_CODE     TEXT,'
          'VERSION_DESC     TEXT,'
          'DATETIME         TIMESTAMP,'
          'CMF_1            TEXT,'
          'CMF_2            TEXT,'
          'CMF_3            TEXT,'
          'CMF_4            TEXT,'
          'CMF_5            TEXT )'
      );
    },

  );

  TbWhPalletDbHelper palletDbHelper = TbWhPalletDbHelper(database);
  TbWhPalletRepo repository = TbWhPalletRepoImpl(palletDbHelper);

  UseCasesWms useCasesWms = UseCasesWms(
    //pallet
    listPallets: ListPalletsUseCase(repository),
    addPallet: AddPalletUseCase(repository),
    updatePallet: UpdatePalletUseCase(repository),
    updatePalletState: UpdatePalletStateUseCase(repository),
    deletePallet: DeletePalletUseCase(repository),
    deletePalletAll: DeletePalletAllUseCase(repository),
    getPalletBySeq: GetPalletBySeq(repository),
    getPalletCountInDevice: GetPalletCountInDevice(repository),

    //wh item ( 품목)

  );


  PalletViewModel palletViewModel = PalletViewModel(useCasesWms);
  return [
    ChangeNotifierProvider(create: (_) => palletViewModel),
  ];
}

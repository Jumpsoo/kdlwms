import 'package:kdlwms/data/data_source/tb_cm_location_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_cm_sync_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_cm_code_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_item_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_pallet_db_helper.dart';
import 'package:kdlwms/data/repository/tb_cm_location_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_cm_sync_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_wh_cm_code_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_wh_item_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_wh_pallet_repo_impl.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';
import 'package:kdlwms/domain/repository/tb_cm_sync_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_item_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_wh_cm_code.dart';
import 'package:kdlwms/domain/use_case/pallet/scan_qr_code.dart';
import 'package:kdlwms/domain/use_case/pallet/select_pallets_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/insert_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/delete_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/update_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/add_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/batch_inert_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/delete_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/select_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/update_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/use_case_data_batch.dart';
import 'package:kdlwms/domain/use_case/use_case_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/use_case_wms.dart';
import 'package:kdlwms/kdl_common/batch/data_sync_viewmodel.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_cm_sync.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_wh_item.dart';

Future<List<SingleChildWidget>> getWmsProviders() async {
  Database database = await openDatabase(
    'wms_db',
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
          'UPDT_DT    TIMESTAMP ) ');

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
          'UPDT_DT         TIMESTAMP )');

      await database.execute('CREATE TABLE TB_CM_LOCATION ( '
          ' WORKSHOP      TEXT,       '
          ' WORKSHOP_NM   TEXT,'
          ' LOCATION      TEXT, '
          ' SET_FLAG      TEXT, '
          ' SYNC_DATETIME  TIMESTAMP ,'
          ' CMF_1      TEXT, '
          ' CMF_2      TEXT, '
          ' CMF_3      TEXT, '
          ' CMF_4      TEXT, '
          ' CMF_5      TEXT   )' );


      //4. 패킹정보
      await database.execute('CREATE TABLE TB_WH_PALLET ( '
          ' PALLET_SEQ    INTEGER PRIMARY KEY AUTOINCREMENT,  '
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

      //5.동기화 정보( 서버 & 클라이언트), 버전, 데이터 동기화 일시
      await database.execute('CREATE TABLE TB_CM_SYNC ( '
          'VERSION_CODE     TEXT,'
          'VERSION_DESC     TEXT,'
          'SYNC_DATETIME    TIMESTAMP,'
          'CMF_1            TEXT,'
          'CMF_2            TEXT,'
          'CMF_3            TEXT,'
          'CMF_4            TEXT,'
          'CMF_5            TEXT )');
    },
  );


  // 실적 입력 & 조회관련
  TbWhPalletDbHelper palletDbHelper = TbWhPalletDbHelper(database);
  TbWhPalletRepo repository = TbWhPalletRepoImpl(palletDbHelper);

  UseCaseWms useCasesWms = UseCaseWms(
    //pallet
    listPallets: ListPalletsUseCase(repository),
    selectDupleCheck: SelectDupleCheck(repository),
    addPallet: InsertPalletUseCase(repository),
    updatePallet: UpdatePalletUseCase(repository),
    updatePalletState: UpdatePalletStateUseCase(repository),
    deletePallet: DeletePalletUseCase(repository),
    deletePalletAll: DeletePalletAllUseCase(repository),
    getPalletBySeq: GetPalletBySeq(repository),
    getPalletCountInDevice: GetPalletCountInDevice(repository),
    scanQrCode: ScanQrCode(),


    //
  );
  PalletViewModel palletViewModel = PalletViewModel(useCasesWms);

  // 기준정보등을 내려받기 위해 사용
  //공통코드
  TbWhCmCodeDbHelper tbWhCmCodeDbHelper = TbWhCmCodeDbHelper(database);
  TbWhCmCodeRepo tbWhCmCodeRepo = TbWhCmCodeRepoImpl(tbWhCmCodeDbHelper);

  //품목정보
  TbWhItemDbHelper tbWhItemDbHelper = TbWhItemDbHelper(database);
  TbWhItemRepo tbWhItemRepo = TbWhItemRepoImpl(tbWhItemDbHelper);

  //작업장 관리
  TbCmLocationDbHelper tbCmLocationDbHelper = TbCmLocationDbHelper(database);
  TbCmLocationRepo tbCmLocationRepo =
      TbCmLocationRepoImpl(tbCmLocationDbHelper);

  //동기화 정보
  TbCmSyncDbHelper tbCmSyncDbHelper = TbCmSyncDbHelper(database);
  TbCmSyncRepo tbCmSyncRepo = TbCmSyncRepoImpl(tbCmSyncDbHelper);

  //작업장 설정 화면 관련
  UseCaseTbCmLocation useCaseTbCmLocation = UseCaseTbCmLocation(
    batchInsertTbCmLocation: BatchInsertTbCmLocation(tbCmLocationRepo),
    addTbCmLocation: AddTbCmLocation(tbCmLocationRepo),
    selectTbCmLocation: SelectTbCmLocation(tbCmLocationRepo),
    selectTbCmLocationAll: SelectTbCmLocationAll(tbCmLocationRepo),
    selectTbCmLocationCurrentItem: SelectTbCmLocationCurrentItem(tbCmLocationRepo),
    deleteTbCmLocation: DeleteTbCmLocation(tbCmLocationRepo),
    updateTbCmLocation: UpdateTbCmLocation(tbCmLocationRepo),
    updateFromSelectTbCmLocationToEnable: UpdateFromSelectTbCmLocationToEnable(tbCmLocationRepo),
    updateFromSelectTbCmLocationToDisableAll: UpdateFromSelectTbCmLocationToDisableAll(tbCmLocationRepo),
  );

  SettingWorkshopViewModel settingWorkshopViewModel =
      SettingWorkshopViewModel(useCaseTbCmLocation);

  //배치 관련
  UseCaseDataBatch useCaseDataBatch = UseCaseDataBatch(
    migTbWhCmCode: MigTbWhCmCode(tbWhCmCodeRepo),
    migTbWhItem: MigTbWhItem(tbWhItemRepo),
    migTbCmLocation: MigTbCmLocation(tbCmLocationRepo),
    migTbCmSync: MigTbCmSync(tbCmSyncRepo),
  );

  DataSyncViewModel dataSyncViewModel = DataSyncViewModel(useCaseDataBatch);

  return [
    ChangeNotifierProvider(create: (_) => palletViewModel),
    ChangeNotifierProvider(create: (_) => settingWorkshopViewModel),
    ChangeNotifierProvider(create: (_) => dataSyncViewModel),
  ];


}
import 'dart:io';

import 'package:kdlwms/data/data_source/pallet_api.dart';
import 'package:kdlwms/data/data_source/tb_cm_location_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_cm_sync_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_server_info_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_cm_code_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_item_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_pallet_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_pallet_load_db_helper.dart';
import 'package:kdlwms/data/repository/cm_code_rcv_repo_impl.dart';
import 'package:kdlwms/data/repository/item_rcv_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_cm_location_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_cm_sync_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_server_info_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_wh_cm_code_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_wh_item_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_wh_pallet_load_repo_impl.dart';
import 'package:kdlwms/data/repository/tb_wh_pallet_repo_impl.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';
import 'package:kdlwms/domain/repository/tb_cm_sync_repo.dart';
import 'package:kdlwms/domain/repository/tb_server_info_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_load_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_wh_cm_code.dart';
import 'package:kdlwms/domain/use_case/pallet/printing_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/scan_qr_code.dart';
import 'package:kdlwms/domain/use_case/pallet/select_master_info.dart';
import 'package:kdlwms/domain/use_case/pallet/select_pallets_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/insert_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/delete_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/update_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/delete__tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/insert_tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/select_tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/update_tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/add_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/batch_inert_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/delete_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/select_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/update_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_sync/save_tb_cm_sync_info.dart';
import 'package:kdlwms/domain/use_case/tb_cm_sync/select_tb_cm_sync.dart';
import 'package:kdlwms/domain/use_case/tb_server_info/select_tb_server_info.dart';
import 'package:kdlwms/domain/use_case/tb_server_info/update_tb_server_info.dart';
import 'package:kdlwms/domain/use_case/tb_wh_item/select_tb_wh_item.dart';
import 'package:kdlwms/domain/use_case/use_case_data_sync.dart';
import 'package:kdlwms/domain/use_case/use_case_server_info.dart';
import 'package:kdlwms/domain/use_case/use_case_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/use_case_tb_wh_item.dart';
import 'package:kdlwms/domain/use_case/use_case_wms.dart';
import 'package:kdlwms/domain/use_case/web_api/get_common_info.dart';
import 'package:kdlwms/kdl_common/web_sync/data_sync_viewmodel.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_cm_sync.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_wh_item.dart';


Future<Database> initializeDB() async {

  // Future<Directory?>? _appSupportDirectory;
  // _appSupportDirectory = getApplicationSupportDirectory();
  // //   openDatabase(
  // //   join(path, 'database.db'),
  // //   onCreate: (database, version) async {
  // //     await database.execute(
  // //         "CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT,
  // //         description TEXT NOT NULL)",
  // //     );
  // //   },
  // //   version: 1,
  // // );

  String path = await getDatabasesPath();
print(path);
  return await openDatabase(
    join(path, 'wms_database.db'),
    version: 1,
    onCreate: (database, version) async {
      //1. 공통코드
      await database.execute('CREATE TABLE TB_WH_CM_CODE ( '
          ' comps       TEXT'
          ',codeId      INT'
          ',grpCd       TEXT'
          ',codeCd      TEXT'
          ',codeKoNm    TEXT'
          ',codeEnNm    TEXT'
          ',codeJaNm    TEXT'
          ',ref1        TEXT'
          ',ref2        TEXT'
          ',ref3        TEXT'
          ',ref4        TEXT'
          ',ref5        TEXT'
          ',codeOrdr    INT'
          ',useYn       TEXT'
          ',rgstrId     INT'
          ',updtrId     INT )');

      //2. 품목정보
      await database.execute('CREATE TABLE TB_WH_ITEM ( '
          'comps  TEXT,'
          'itemNm  TEXT,'
          'standard  TEXT,'
          'qt  TEXT,'
          'itemNo  TEXT,'
          'boxKg  INTEGER,'
          'length  INTEGER,'
          'width  INTEGER,'
          'height  INTEGER,'
          'warehouseCd  TEXT,'
          'warehouseNm  TEXT,'
          'warehouseArea  TEXT,'
          'useYn  TEXT,'
          'rgstrId  INTEGER,'
          'updtrId  INTEGER)');

      await database.execute('CREATE TABLE TB_CM_LOCATION ( '
          ' workshop      TEXT,       '
          ' workshopNm   TEXT,'
          ' location      TEXT, '
          ' setFlag      TEXT, '
          ' syncDateTime  TIMESTAMP ,'
          ' cmf1      TEXT, '
          ' cmf2      TEXT, '
          ' cmf3      TEXT, '
          ' cmf4      TEXT, '
          ' cmf5      TEXT   )');

      //4. 패킹정보
      await database.execute('CREATE TABLE TB_WH_PALLET ( '
          ' comps         TEXT'
          ',palletSeq     INT'
          ',workshop      TEXT'
          ',location      TEXT'
          ',itemNo        TEXT'
          ',itemLot       TEXT'
          ',quantity      INT'
          ',state         TEXT'
          ',barcode       TEXT'
          ',scanDate      TIMESTAMP'
          ',scanUsernm    TEXT'
          ',boxNo         INT'
          ',arrival       TEXT'
          ',printFlag     TEXT'
          ',printDate     TIMESTAMP'
          ',printUser     TEXT'
          ',as400IfFlag   TEXT'
          ',as400IfDate   TIMESTAMP'
          ',as400IfUser   TEXT'
          ',rgstrId       INT'
          ',rgstDt        TIMESTAMP'
          ',updtrId       INT'
          ',updtDt        TIMESTAMP)');

      //4. 상차대상정보
      await database.execute('CREATE TABLE TB_WH_PALLET_LOAD ( '
          ' comps         TEXT'
          ',palletSeq     INT'
          ',workshop      TEXT'
          ',location      TEXT'
          ',itemNo        TEXT'
          ',itemLot       TEXT'
          ',quantity      INT'
          ',state         TEXT'
          ',barcode       TEXT'
          ',scanDate      TIMESTAMP'
          ',scanUsernm    TEXT'
          ',boxNo         INT'
          ',printFlag     TEXT'
          ',printDate     TIMESTAMP'
          ',printUser     TEXT'
          ',as400IfFlag   TEXT'
          ',as400IfDate   TIMESTAMP'
          ',as400IfUser   TEXT'
          ',rgstrId       INT'
          ',rgstDt        TIMESTAMP'
          ',updtrId       INT'
          ',updtDt        TIMESTAMP)');

      //5.동기화 정보( 서버 & 클라이언트), 버전, 데이터 동기화 일시
      await database.execute('CREATE TABLE TB_CM_SYNC ( '
          'versionCode     TEXT,'
          'versionDesc     TEXT,'
          'syncDateTime    TIMESTAMP,'
          'cmf1            TEXT,'
          'cmf2            TEXT,'
          'cmf3            TEXT,'
          'cmf4            TEXT,'
          'cmf5            TEXT )');

      //6. 서버 접속 정보
      await database.execute('CREATE TABLE TB_SERVER_INFO ( '
          'serverUrl     TEXT,'
          'comps         TEXT,'
          'deviceId     TEXT,'
          'vibrateState  INT,'
          'scanAlwaysState  INT )');

      //
      // //6. 공장정보
      // await database.execute('CREATE TABLE TB_FACTORY ( '
      //     'FACTORY_CD     TEXT,'
      //     'FACTORY_NM     TEXT)');
      //
      // //7. 현재생성한 MAX PALLET 정보
      // await database.execute('CREATE TABLE TB_PALLET_MAX_SEQ ( '
      //     'MAX_SEQ     INT )');
    },
  );


}

Future<List<SingleChildWidget>> getWmsProviders() async {

  Database database = await initializeDB();

  //서버사이드 repository 등록
  ItemRcvRepoApiImpl itemRcvRepo = ItemRcvRepoApiImpl();
  CmCodeRcvRepoApiImpl cmCodeRcvRepo = CmCodeRcvRepoApiImpl();
  // CmCodeRcvApi cmCodeRcvApi = CmCodeRcvApi();
  PalletApi palletApi = PalletApi();

  // 기준정보등을 내려받기 위해 사용
  //공통코드
  TbWhCmCodeDbHelper tbWhCmCodeDbHelper = TbWhCmCodeDbHelper(database);
  TbWhCmCodeRepo tbWhCmCodeRepo = TbWhCmCodeRepoImpl(tbWhCmCodeDbHelper);

  // 실적 입력 & 조회관련
  TbWhPalletDbHelper palletDbHelper = TbWhPalletDbHelper(database);
  TbWhPalletRepo palletRepository =
      TbWhPalletRepoImpl(palletDbHelper, tbWhCmCodeDbHelper, palletApi);
  TbWhPalletLoadDbHelper palletLoadDbHelper = TbWhPalletLoadDbHelper(database);
  TbWhPalletLoadRepo palletLoadRepository =
      TbWhPalletLoadRepoImpl(palletLoadDbHelper);

  //마스터 정보관련 (품목)
  TbWhItemDbHelper tbWhItemDbHelper = TbWhItemDbHelper(database);
  TbWhItemRepoImpl tbWhItemRepo = TbWhItemRepoImpl(tbWhItemDbHelper);

  UseCaseWms useCasesWms = UseCaseWms(
    //pallet
    selectPackingListUseCase: SelectPackingListUseCase(palletRepository),
    selectCheckValue: SelectCheckValue(palletRepository),
    addPallet: InsertPalletUseCase(palletRepository),
    updatePallet: UpdatePalletUseCase(palletRepository),
    loadingPalletFinishUseCase:
        LoadingPalletFinishUseCase(palletLoadRepository),
    deletePallet: DeletePalletUseCase(palletRepository),
    deletePalletAllUseCase: DeletePalletAllUseCase(palletRepository),
    getPalletCountInDevice: GetPalletCountInDevice(palletRepository),
    scanQrCode: ScanQrCode(),
    selectItemList: SelectItemList(tbWhItemRepo),
    selectPrintingList: SelectPrintingList(palletRepository),
    printingPalletUseCase:
        PrintingPalletUseCase(palletLoadRepository, palletRepository),
    selectPackingSummaryUseCase: SelectPackingSummaryUseCase(palletRepository),

    selectPalletingListUseCase: SelectPalletingListUseCase(palletRepository),
    selectPalletingSummaryUseCase:
        SelectPalletingSummaryUseCase(palletRepository),

    //상차관리 관련
    selectLoadingSummaryUseCase:
        SelectLoadingSummaryUseCase(palletLoadRepository),
    selectLoadingListUseCase: SelectLoadingListUseCase(palletLoadRepository),
    confirmPalletFinishUseCase: ConfirmPalletFinishUseCase(palletRepository),
    getPalletLoadCountInDevice:
        GetPalletLoadCountInDevice(palletLoadRepository),
    deletePalletLoadAllUseCase:
        DeletePalletLoadAllUseCase(palletLoadRepository),
    selectLoadingListByApiUseCase: SelectLoadingListByApiUseCase(palletApi),
    deleteTbWhPalletByLocationUseCase:
        DeleteTbWhPalletByLocationUseCase(palletRepository),
    selectPalletForDeleteUseCase:
        SelectPalletForDeleteUseCase(palletRepository),

    //
  );

  UseCaseTbWhItem useCaseTbWhItem = UseCaseTbWhItem(
    selectTbWhItem: SelectTbWhItem(tbWhItemRepo),
  );

  PalletViewModel palletViewModel = PalletViewModel(useCasesWms);

  //작업장 관리
  TbCmLocationDbHelper tbCmLocationDbHelper = TbCmLocationDbHelper(database);
  TbCmLocationRepo tbCmLocationRepo =
      TbCmLocationRepoImpl(tbCmLocationDbHelper);

  //동기화 정보
  TbCmSyncDbHelper tbCmSyncDbHelper = TbCmSyncDbHelper(database);
  TbCmSyncRepo tbCmSyncRepo = TbCmSyncRepoImpl(tbCmSyncDbHelper);

  //서버 접속정보
  TbServerInfoDbHelper tbServerInfoDbHelper = TbServerInfoDbHelper(database);
  TbServerInfoRepo tbServerInfoRepo =
      TbServerInfoRepoImpl(tbServerInfoDbHelper);

  //작업장 설정 화면 관련
  UseCaseCommonInfo useCaseTbCmLocation = UseCaseCommonInfo(
    batchInsertTbCmLocation: BatchInsertTbCmLocation(tbCmLocationRepo),
    addTbCmLocation: AddTbCmLocation(tbCmLocationRepo),
    selectTbCmLocation: SelectTbCmLocation(tbCmLocationRepo),
    selectTbCmLocationAll: SelectTbCmLocationAll(tbCmLocationRepo),
    selectTbCmLocationCurrentItem:
        SelectTbCmLocationCurrentItem(tbCmLocationRepo),
    deleteTbCmLocation: DeleteTbCmLocation(tbCmLocationRepo),
    updateTbCmLocation: UpdateTbCmLocation(tbCmLocationRepo),
    updateFromSelectTbCmLocationToEnable:
        UpdateFromSelectTbCmLocationToEnable(tbCmLocationRepo),
    updateFromSelectTbCmLocationToDisableAll:
        UpdateFromSelectTbCmLocationToDisableAll(tbCmLocationRepo),
    getTbWhCmCodeList: GetTbWhCmCodeList(tbWhCmCodeRepo),
    deleteTbWhCmCode: DeleteTbWhCmCode(tbWhCmCodeRepo),
    selectTbWhCmCodeListByCodeCd: SelectTbWhCmCodeListByCodeCd(tbWhCmCodeRepo),
    selectTbWhCmCodeListByGrpCd: SelectTbWhCmCodeListByGrpCd(tbWhCmCodeRepo),
    deleteTbWhCmCodeAll: DeleteTbWhCmCodeAll(tbWhCmCodeRepo),
    insertTbWhCmCode: InsertTbWhCmCode(tbWhCmCodeRepo),
    updateTbWhCmCode: UpdateTbWhCmCode(tbWhCmCodeRepo),
    getCurrentLocalVersion: GetCurrentLocalVersion(tbWhCmCodeRepo),
  );

  UseCaseServerInfo useCaseServerInfo = UseCaseServerInfo(
    selectTbServerInfoUseCase: SelectTbServerInfoUseCase(tbServerInfoRepo),
    mergeTbServerInfoUseCase: MergeTbServerInfoUseCase(tbServerInfoRepo),
    selectPropertyInfoUseCase: SelectPropertyInfoUseCase(tbServerInfoRepo),
  );

  SettingInfoViewModel settingWorkshopViewModel = SettingInfoViewModel(
      useCaseTbCmLocation, useCaseServerInfo, useCaseTbWhItem);

  //배치 관련
  UseCaseDataSync useCaseDataBatch = UseCaseDataSync(
    migTbWhCmCode: MigTbWhCmCode(tbWhCmCodeRepo, cmCodeRcvRepo),
    migTbWhItem: MigTbWhItem(tbWhItemRepo, itemRcvRepo),
    migTbCmLocation: MigTbCmLocation(tbCmLocationRepo, cmCodeRcvRepo),
    migTbCmSync: MigTbCmSync(tbCmSyncRepo),
    // getCurrentVersionRow: GetCurrentVersionRow(tbCmSyncRepo),
    getServerVersion: GetServerVersion(cmCodeRcvRepo),
    updateLocalVersion: UpdateLocalVersion(tbWhCmCodeRepo),
    saveLastSyncInfo: SaveLastSyncInfo(tbCmSyncRepo),
    getLastSyncInfo: GetLastSyncInfo(tbCmSyncRepo),
  );

  DataSyncViewModel dataSyncViewModel = DataSyncViewModel(useCaseDataBatch);

  return [
    ChangeNotifierProvider(create: (_) => palletViewModel),
    ChangeNotifierProvider(create: (_) => settingWorkshopViewModel),
    ChangeNotifierProvider(create: (_) => dataSyncViewModel),
  ];
}

import 'package:kdlwms/data/data_source/tb_cm_location_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_cm_sync_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_cm_code_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_item_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_pallet_db_helper.dart';
import 'package:kdlwms/data/repository/cm_code_rcv_repo_impl.dart';
import 'package:kdlwms/data/repository/item_rcv_repo_impl.dart';
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
import 'package:kdlwms/domain/use_case/pallet/select_master_info.dart';
import 'package:kdlwms/domain/use_case/pallet/select_pallets_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/insert_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/delete_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/update_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/add_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/batch_inert_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/delete_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/select_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/update_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_sync/select_tb_cm_sync.dart';
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
import 'package:kdlwms/domain/use_case/tb_cm_sync/select_tb_cm_sync.dart';

Future<List<SingleChildWidget>> getWmsProviders() async {

  //deleteDatabase('wms_db');

  Database database = await openDatabase(
    'wms_db',
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
          ' WORKSHOP      TEXT,       '
          ' WORKSHOP_NM   TEXT,'
          ' LOCATION      TEXT, '
          ' SET_FLAG      TEXT, '
          ' SYNC_DATETIME  TIMESTAMP ,'
          ' CMF_1      TEXT, '
          ' CMF_2      TEXT, '
          ' CMF_3      TEXT, '
          ' CMF_4      TEXT, '
          ' CMF_5      TEXT   )');

      //4. 패킹정보
      await database.execute('CREATE TABLE TB_WH_PALLET ( '
                                                        ' comps         TEXT'
                                                        ',palletSeq     INT'
                                                        ',workshop      TEXT'
                                                        ',location      TEXT'
                                                        ',itemNo        TEXT'
                                                        ',itemLot       TEXT'
                                                        ',quantity      INT'
                                                        ',state         INT'
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
          'VERSION_CODE     TEXT,'
          'VERSION_DESC     TEXT,'
          'SYNC_DATETIME    TIMESTAMP,'
          'CMF_1            TEXT,'
          'CMF_2            TEXT,'
          'CMF_3            TEXT,'
          'CMF_4            TEXT,'
          'CMF_5            TEXT )');

      //6. 공장정보
      await database.execute('CREATE TABLE TB_FACTORY ( '
          'FACTORY_CD     TEXT,'
          'FACTORY_NM     TEXT)');

      //7. 현재생성한 MAX PALLET 정보
      await database.execute('CREATE TABLE TB_PALLET_MAX_SEQ ( '
          'MAX_SEQ     INT )');

    },
  );


  // 실적 입력 & 조회관련
  TbWhPalletDbHelper palletDbHelper = TbWhPalletDbHelper(database);
  TbWhPalletRepo repository = TbWhPalletRepoImpl(palletDbHelper);

  //마스터 정보관련 (품목)
  TbWhItemDbHelper tbWhItemDbHelper = TbWhItemDbHelper(database);
  TbWhItemRepoImpl tbWhItemRepo = TbWhItemRepoImpl(tbWhItemDbHelper);

  UseCaseWms useCasesWms = UseCaseWms(
    //pallet
    listPallets: ListPalletsUseCase(repository),
    selectDupleCheck: SelectDupleCheck(repository),
    addPallet: InsertPalletUseCase(repository),
    updatePallet: UpdatePalletUseCase(repository),
    updatePalletFinishUseCase: UpdatePalletFinishUseCase(repository),
    deletePallet: DeletePalletUseCase(repository),
    deletePalletAll: DeletePalletAllUseCase(repository),
    getPalletBySeq: GetPalletBySeq(repository),
    getPalletCountInDevice: GetPalletCountInDevice(repository),
    scanQrCode: ScanQrCode(),
    selectItemList: SelectItemList(tbWhItemRepo),
    //
  );


  PalletViewModel palletViewModel = PalletViewModel(useCasesWms);

  // 기준정보등을 내려받기 위해 사용
  //공통코드
  TbWhCmCodeDbHelper tbWhCmCodeDbHelper = TbWhCmCodeDbHelper(database);
  TbWhCmCodeRepo tbWhCmCodeRepo = TbWhCmCodeRepoImpl(tbWhCmCodeDbHelper);

  //작업장 관리
  TbCmLocationDbHelper tbCmLocationDbHelper = TbCmLocationDbHelper(database);
  TbCmLocationRepo tbCmLocationRepo =
      TbCmLocationRepoImpl(tbCmLocationDbHelper);

  //동기화 정보
  TbCmSyncDbHelper tbCmSyncDbHelper = TbCmSyncDbHelper(database);
  TbCmSyncRepo tbCmSyncRepo = TbCmSyncRepoImpl(tbCmSyncDbHelper);

  //서버사이드 repository 등록
  ItemRcvRepoImpl itemRcvRepo = ItemRcvRepoImpl();
  CmCodeRcvRepoImpl cmCodeRcvRepo = CmCodeRcvRepoImpl();

  //작업장 설정 화면 관련
  UseCaseTbCmLocation useCaseTbCmLocation = UseCaseTbCmLocation(
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
  );

  SettingWorkshopViewModel settingWorkshopViewModel =
      SettingWorkshopViewModel(useCaseTbCmLocation);

  //배치 관련
  UseCaseDataBatch useCaseDataBatch = UseCaseDataBatch(
    migTbWhCmCode: MigTbWhCmCode(tbWhCmCodeRepo),
    migTbWhItem: MigTbWhItem(tbWhItemRepo, itemRcvRepo),
    migTbCmLocation: MigTbCmLocation(tbCmLocationRepo, cmCodeRcvRepo),
    migTbCmSync: MigTbCmSync(tbCmSyncRepo),
    getCurrentVersionRow: GetCurrentVersionRow(tbCmSyncRepo),
  );

  DataSyncViewModel dataSyncViewModel = DataSyncViewModel(useCaseDataBatch);

  return [
    ChangeNotifierProvider(create: (_) => palletViewModel),
    ChangeNotifierProvider(create: (_) => settingWorkshopViewModel),
    ChangeNotifierProvider(create: (_) => dataSyncViewModel),
  ];
}

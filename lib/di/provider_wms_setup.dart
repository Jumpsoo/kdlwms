import 'package:kdlwms/data/data_source/pallet_db_helper.dart';
import 'package:kdlwms/data/repository/pallet_repository_impl.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';
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
          ' UPDT_DT       TIMESTAMP )');
    },
  );

  PalletDbHelper palletDbHelper = PalletDbHelper(database);
  PalletRepository repository = PalletRepositoryImpl(palletDbHelper);

  UseCasesWms useCasesWms = UseCasesWms(
    listPallets: ListPalletsUseCase(repository),
    addPallet: AddPalletUseCase(repository),
    updatePallet: UpdatePalletUseCase(repository),
    updatePalletState: UpdatePalletStateUseCase(repository),
    deletePallet: DeletePalletUseCase(repository),
    deletePalletAll: DeletePalletAllUseCase(repository),
    getPalletBySeq: GetPalletBySeq(repository),
    getPalletCountInDevice: GetPalletCountInDevice(repository),
  );

  PalletViewModel palletViewModel = PalletViewModel(useCasesWms);
  return [
    ChangeNotifierProvider(create: (_) => palletViewModel),
  ];
}

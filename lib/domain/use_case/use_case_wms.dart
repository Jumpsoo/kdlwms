import 'package:kdlwms/domain/use_case/pallet/insert_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/printing_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/select_master_info.dart';
import 'package:kdlwms/domain/use_case/pallet/update_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/delete_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/select_pallets_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/scan_qr_code.dart';

class UseCaseWms {
  final InsertPalletUseCase addPallet;
  final UpdatePalletUseCase updatePallet;
  final UpdatePalletFinishUseCase updatePalletFinishUseCase;
  final DeletePalletUseCase deletePallet;
  final DeletePalletAllUseCase deletePalletAll;

  //01. 실적처리 화면 쿼리
  // packing 중인것과 상차된것 구분해서처리
  // 상차된항목은 packing 중인항목에 조회되면 안됨
  final SelectPackingListUseCase selectPackingListUseCase;
  final SelectPackingSummaryUseCase selectPackingSummaryUseCase;

  //02. 실적조회 화면 쿼리
  final SelectPalletingListUseCase selectPalletingListUseCase;
  final SelectPalletingSummaryUseCase selectPalletingSummaryUseCase;

  //03. 라벨링 화면 쿼리
  final SelectPrintingList selectPrintingList;

  //04.상차화면 관련 조회 쿼리
  final SelectLoadingListUseCase selectLoadingListUseCase;
  final SelectLoadingSummaryUseCase selectLoadingSummaryUseCase;

  final GetPalletCountInDevice getPalletCountInDevice;
  final SelectCheckValue selectCheckValue;

  final ScanQrCode scanQrCode;

  final SelectItemList selectItemList;

  final PrintingPalletUseCase printingPalletUseCase;

  UseCaseWms({
    required this.addPallet,
    required this.updatePallet,
    required this.updatePalletFinishUseCase,
    required this.deletePallet,
    required this.deletePalletAll,
    required this.selectPackingListUseCase,
    required this.getPalletCountInDevice,
    required this.selectCheckValue,
    required this.scanQrCode,
    required this.selectPackingSummaryUseCase,
    required this.selectLoadingSummaryUseCase,
    required this.selectLoadingListUseCase,
    required this.selectItemList,
    required this.selectPrintingList,
    required this.printingPalletUseCase,
    required this.selectPalletingListUseCase,
    required this.selectPalletingSummaryUseCase,
  });
}

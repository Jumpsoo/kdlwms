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

  // packing 중인것과 상차된것 구분해서처리
  // 상차된항목은 packing 중인항목에 조회되면 안됨
  final SelectPackingListUseCase selectPackingList;
  final GetPalletBySeq getPalletBySeq;
  final GetPalletCountInDevice getPalletCountInDevice;
  final SelectCheckValue selectCheckValue;

  final ScanQrCode scanQrCode;

  final SelectTbWhPalletGroup selectTbWhPalletGroup;
  final SelectTbWhPalletListByLocation selectTbWhPalletListByLocation;

  final SelectItemList selectItemList;
  final SelectPrintingList selectPrintingList;
  final PrintingPalletUseCase printingPalletUseCase;

  UseCaseWms({
    required this.addPallet,
    required this.updatePallet,
    required this.updatePalletFinishUseCase,
    required this.deletePallet,
    required this.deletePalletAll,
    required this.selectPackingList,
    required this.getPalletBySeq,
    required this.getPalletCountInDevice,
    required this.selectCheckValue,
    required this.scanQrCode,
    required this.selectTbWhPalletGroup,
    required this.selectTbWhPalletListByLocation,
    required this.selectItemList,
    required this.selectPrintingList,
    required this.printingPalletUseCase,
  });
}

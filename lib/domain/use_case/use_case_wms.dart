import 'package:kdlwms/domain/use_case/pallet/insert_pallet_use_case.dart';
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

  final ListPalletsUseCase listPallets;
  final GetPalletBySeq getPalletBySeq;
  final GetPalletCountInDevice getPalletCountInDevice;
  final SelectDupleCheck selectDupleCheck;

  final ScanQrCode scanQrCode;

  final SelectItemList selectItemList;

  UseCaseWms({
    required this.addPallet,
    required this.updatePallet,
    required this.updatePalletFinishUseCase,
    required this.deletePallet,
    required this.deletePalletAll,
    required this.listPallets,
    required this.getPalletBySeq,
    required this.getPalletCountInDevice,
    required this.selectDupleCheck,
    required this.scanQrCode,
    required this.selectItemList,
  });
}

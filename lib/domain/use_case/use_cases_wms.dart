 import 'package:kdlwms/domain/use_case/pallet/add_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/delete_pallet_all_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/get_pallet_by_seq.dart';
import 'package:kdlwms/domain/use_case/pallet/get_pallet_count_in_device.dart';
 import 'package:kdlwms/domain/use_case/pallet/update_pallet_use_case.dart';
 import 'package:kdlwms/domain/use_case/pallet/delete_pallet_use_case.dart';
 import 'package:kdlwms/domain/use_case/pallet/list_pallets_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/update_palletstate_use_case.dart';

class UseCasesWms {
  final AddPalletUseCase addPallet;
  final UpdatePalletUseCase updatePallet;
  final UpdatePalletStateUseCase updatePalletState;
  final DeletePalletUseCase deletePallet;
  final DeletePalletAllUseCase deletePalletAll;

  final ListPalletsUseCase listPallets;
  final GetPalletBySeq getPalletBySeq;
  final GetPalletCountInDevice getPalletCountInDevice;

  UseCasesWms({
    required this.addPallet,
    required this.updatePallet,
    required this.updatePalletState,
    required this.deletePallet,
    required this.deletePalletAll,
    required this.listPallets,
    required this.getPalletBySeq,
    required this.getPalletCountInDevice,

  });
}

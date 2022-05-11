import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class AddPalletUseCase{
  final PalletRepository repository;

  AddPalletUseCase(this.repository);

  Future<void> call (Pallet pallet) async {
    await repository.insertPallet(pallet);
  }

}
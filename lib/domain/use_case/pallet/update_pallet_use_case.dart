import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class UpdatePalletUseCase{
  final PalletRepository repository;

  UpdatePalletUseCase(this.repository);

  Future<void> call (Pallet pallet) async {
    await repository.updatePallet(pallet);
  }
}
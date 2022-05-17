import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class UpdatePalletStateUseCase{
  final PalletRepository repository;

  UpdatePalletStateUseCase(this.repository);

  Future<void> call (List<Pallet> pallets) async {
    await repository.updatePalletState(pallets);
  }
}
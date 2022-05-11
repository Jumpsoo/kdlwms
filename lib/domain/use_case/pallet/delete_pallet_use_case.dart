import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class DeletePalletUseCase{
  final PalletRepository repository;

  DeletePalletUseCase(this.repository);

  Future<void> call(Pallet pallet) async {
    await repository.deletePallet(pallet);
  }

}


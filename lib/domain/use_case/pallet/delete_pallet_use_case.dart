import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class DeletePalletUseCase{
  final PalletRepository repository;

  DeletePalletUseCase(this.repository);

  Future<bool> call(List<Pallet> pallet) async {
    return await repository.deletePallet(pallet);
  }

}


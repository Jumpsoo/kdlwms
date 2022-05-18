import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class DeletePalletAllUseCase{
  final PalletRepository repository;

  DeletePalletAllUseCase(this.repository);

  Future<bool> call() async {
    return await repository.deletePalletAll();
  }

}


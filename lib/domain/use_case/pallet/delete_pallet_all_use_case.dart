import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

class DeletePalletAllUseCase{
  final TbWhPalletRepo repository;

  DeletePalletAllUseCase(this.repository);

  Future<bool> call() async {
    return await repository.deleteTbWhPalletAll();
  }

}


import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

class DeletePalletUseCase{
  final TbWhPalletRepo repository;

  DeletePalletUseCase(this.repository);

  Future<bool> call(List<TbWhPallet> pallet) async {
    return await repository.deleteTbWhPallet(pallet);
  }

}

class DeletePalletAllUseCase{
  final TbWhPalletRepo repository;

  DeletePalletAllUseCase(this.repository);

  Future<bool> call() async {
    return await repository.deleteTbWhPalletAll();
  }

}



import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

class UpdatePalletUseCase{
  final TbWhPalletRepo repository;

  UpdatePalletUseCase(this.repository);

  Future<void> call (List<TbWhPallet> pallets) async {
    await repository.updateTbWhPallet(pallets);
  }
}
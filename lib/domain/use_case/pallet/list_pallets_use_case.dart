import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

class ListPalletsUseCase{
  final TbWhPalletRepo repository;

  ListPalletsUseCase(this.repository);

  Future<List<TbWhPallet>?> call (String sWorkShop, String sLocation, int nState) async {
    return await repository.getTbWhPalletList(sWorkShop, sLocation, nState);
  }

}
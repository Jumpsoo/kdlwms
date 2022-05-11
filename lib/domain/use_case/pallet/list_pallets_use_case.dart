import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class ListPalletsUseCase{
  final PalletRepository repository;

  ListPalletsUseCase(this.repository);

  Future<List<Pallet>?> call (String sWorkShop, String sLocation, int nState) async {
    return await repository.getPalletList(sWorkShop, sLocation, nState);
  }

}
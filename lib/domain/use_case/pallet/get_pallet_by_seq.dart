import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class GetPalletBySeq{
  final PalletRepository repository;

  GetPalletBySeq(this.repository);

  Future<Pallet?> call(int palletSeq) async {
    return await repository.getPalletBySeq(palletSeq);
  }
}


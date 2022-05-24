import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

class GetPalletBySeq{
  final TbWhPalletRepo repository;

  GetPalletBySeq(this.repository);

  Future<TbWhPallet?> call(int palletSeq) async {
    return await repository.getTbWhPalletBySeq(palletSeq);
  }
}


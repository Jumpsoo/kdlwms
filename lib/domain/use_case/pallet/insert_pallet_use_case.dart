import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

class InsertPalletUseCase {
  final TbWhPalletRepo repository;

  InsertPalletUseCase(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<bool> call(TbWhPallet pallet) async {

    TbWhPallet? result = await repository.getTbWhPalletBySeq(pallet.palletSeq!);
    if(result != null){
      List<TbWhPallet> pallets = [];
      pallets.add(pallet);
      await repository.deleteTbWhPallet(pallets);
    }
    return await repository.insertTbWhPallet(pallet);
  }
}

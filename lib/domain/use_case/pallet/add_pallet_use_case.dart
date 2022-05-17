import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class AddPalletUseCase {
  final PalletRepository repository;

  AddPalletUseCase(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<bool> call(Pallet pallet) async {

    Pallet? result = await repository.getPalletBySeq(pallet.PALLET_SEQ);
    if(result != null){
      List<Pallet> pallets = [];
      pallets.add(pallet);
      await repository.deletePallet(pallets);
    }
    return await repository.insertPallet(pallet);
  }
}

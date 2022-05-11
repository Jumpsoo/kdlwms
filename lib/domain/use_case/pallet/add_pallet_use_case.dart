import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class AddPalletUseCase {
  final PalletRepository repository;

  AddPalletUseCase(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<void> call(Pallet pallet) async {

    Pallet? result = await repository.getPalletBySeq(pallet.PALLET_SEQ);
    if(result != null){
      await repository.deletePallet(pallet);
    }
    await repository.insertPallet(pallet);
  }
}

import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

class InsertPalletUseCase {
  final TbWhPalletRepo repository;

  InsertPalletUseCase(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(TbWhPallet pallet) async {
    // Result resultChk = repository.
    return await repository.upsertTbWhPallet(pallet);
  }
}

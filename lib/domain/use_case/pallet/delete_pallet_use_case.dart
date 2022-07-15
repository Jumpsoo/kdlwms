import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_load_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

import '../../../data/data_source/result.dart';

class DeletePalletUseCase {
  final TbWhPalletRepo repository;

  DeletePalletUseCase(this.repository);

  Future<Result<bool>> call(List<TbWhPallet> pallets) async {
    return await repository.deleteTbWhPallet(pallets);
  }
}

class DeletePalletAllUseCase {
  final TbWhPalletRepo repository;

  DeletePalletAllUseCase(this.repository);

  Future<Result<bool>> call() async {
    return await repository.deleteTbWhPalletAll();
  }
}

class DeletePalletLoadAllUseCase {
  final TbWhPalletLoadRepo repository;

  DeletePalletLoadAllUseCase(this.repository);

  Future<Result<bool>> call() async {
    return await repository.deleteTbWhPalletLoadAll();
  }
}

//05. 이력삭제용
class DeleteTbWhPalletByLocationUseCase {
  final TbWhPalletRepo repository;

  DeleteTbWhPalletByLocationUseCase(this.repository);

  Future<Result<bool>> call(
      List<TbWhPalletForDelete> tbWhPalletForDeleteList) async {
    return await repository.deleteTbWhPalletByLocation(tbWhPalletForDeleteList);
  }
}

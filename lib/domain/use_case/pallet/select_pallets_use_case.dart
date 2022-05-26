import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

class ListPalletsUseCase {
  final TbWhPalletRepo repository;

  ListPalletsUseCase(this.repository);

  Future<List<TbWhPallet>?> call(String sLocation, String sWorkShop, int nPalletSeq) async {
    return await repository.getTbWhPalletList(
      sLocation, sWorkShop, nPalletSeq,);
  }
}

class GetPalletBySeq{
  final TbWhPalletRepo repository;

  GetPalletBySeq(this.repository);

  Future<TbWhPallet?> call(int palletSeq) async {
    return await repository.getTbWhPalletBySeq(palletSeq);
  }
}

class GetPalletCountInDevice {
  final TbWhPalletRepo repository;

  GetPalletCountInDevice(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<int> call() async {
    return await repository.getTbWhPalletCountInDevice();
  }
}

class SelectDupleCheck {
  final TbWhPalletRepo repository;

  SelectDupleCheck(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<List<TbWhPallet>?> call(String sBarCode) async {
    return await repository.selectDupleCheck(sBarCode);
  }
}



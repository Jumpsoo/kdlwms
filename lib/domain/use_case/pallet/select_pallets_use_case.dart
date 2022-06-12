import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class ListPalletsUseCase {
  final TbWhPalletRepo repository;

  ListPalletsUseCase(this.repository);

  Future<List<TbWhPallet>?> call(
      String sWorkShop, String sLocation, int nState) async {

    TbWhPallet condTbWhPallet = TbWhPallet(
        comps: gFactory, workshop: sWorkShop, location: sLocation, state: nState);
    return await repository.selectTbWhPalletList(condTbWhPallet);
  }
}

class GetPalletBySeq {
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

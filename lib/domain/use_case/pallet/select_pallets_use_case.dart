import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class SelectPackingListUseCase {
  final TbWhPalletRepo repository;

  SelectPackingListUseCase(this.repository);

  Future<List<TbWhPallet>?> call(
      String sWorkShop, String sLocation, int nState) async {
    TbWhPallet condTbWhPallet = TbWhPallet(
        comps: gComps, workshop: sWorkShop, location: sLocation, state: nState);
    return await repository.selectPackingList(condTbWhPallet);
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

class SelectCheckValue {
  final TbWhPalletRepo repository;

  SelectCheckValue(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(TbWhPallet tbWhPallet) async {
    return await repository.selectCheckValue(tbWhPallet);
  }
}

//인쇄대상 조회
class SelectPrintingList {
  final TbWhPalletRepo repository;

  SelectPrintingList(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<List<TbWhPallet>?> call(int nState) async {
    return await repository.selectPrintingList(nState);
  }
}

//실적처리 화면 상단 조회
class SelectTbWhPalletGroup {
  final TbWhPalletRepo repository;

  SelectTbWhPalletGroup(this.repository);

  Future<List<TbWhPalletGroup>?> call(
      String sComps, String sWareHouse, String sLocation) async {
    TbWhPallet tbWhPallet =
        TbWhPallet(comps: sComps, workshop: sWareHouse, location: sLocation);

    return await repository.selectTbWhPalletGroup(tbWhPallet);
  }
}

//실적처리 화면 하단 조회
class SelectTbWhPalletListByLocation {
  final TbWhPalletRepo repository;

  SelectTbWhPalletListByLocation(this.repository);

  Future<List<TbWhPallet>?> call(TbWhPallet tbWhPallet) async {
    return await repository.selectTbWhPalletListByLocation(tbWhPallet);
  }
}

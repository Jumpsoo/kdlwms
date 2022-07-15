import 'package:kdlwms/data/data_source/pallet_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_load.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_load_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

//01-01. 실적처리 화면 상단 데이터 조회(집계)
class SelectPackingSummaryUseCase {
  final TbWhPalletRepo repository;

  SelectPackingSummaryUseCase(this.repository);

  Future<List<TbWhPalletGroup>?> call(
      String sComps, String sWareHouse, String sLocation) async {
    TbWhPallet tbWhPallet =
        TbWhPallet(comps: sComps, workshop: sWareHouse, location: sLocation);

    return await repository.selectPackingSummary(tbWhPallet);
  }
}

//01-02. 실적처리 화면 하단 데이터 조회(상세)
class SelectPackingListUseCase {
  final TbWhPalletRepo repository;

  SelectPackingListUseCase(this.repository);

  Future<List<TbWhPallet>?> call(String sWorkShop, String sLocation) async {
    TbWhPallet condTbWhPallet =
        TbWhPallet(comps: gComps, workshop: sWorkShop, location: sLocation);

    return await repository.selectPackingList(condTbWhPallet);
  }
}

//02. 실적 조회 화면 쿼리
//02-01. 상단 집계
class SelectPalletingSummaryUseCase {
  final TbWhPalletRepo repository;

  SelectPalletingSummaryUseCase(this.repository);

  Future<List<TbWhPalletGroup>?> call(
      String sComps, String sWareHouse, String sLocation) async {
    TbWhPallet tbWhPallet =
        TbWhPallet(comps: sComps, workshop: sWareHouse, location: sLocation);
    return await repository.selectPalletSummary(tbWhPallet);
  }
}

//02-01. 하단 상세
class SelectPalletingListUseCase {
  final TbWhPalletRepo repository;

  SelectPalletingListUseCase(this.repository);

  Future<Result<List<TbWhPallet>?>> call(
      String sComps, String sWareHouse, String sLocation) async {
    TbWhPallet tbWhPallet =
        TbWhPallet(comps: sComps, workshop: sWareHouse, location: sLocation);

    return await repository.selectPalletList(tbWhPallet);
  }
}

//04-01. 상차완료 상단 데이터 조회(집계)
class SelectLoadingSummaryUseCase {
  final TbWhPalletLoadRepo repository;

  SelectLoadingSummaryUseCase(this.repository);

  Future<Result<List<TbWhPalletLoadGroup>?>> call(
      String sComps, String sWareHouse, String sLocation) async {
    TbWhPalletLoad tbWhPalletLoad = TbWhPalletLoad(
        comps: sComps, workshop: sWareHouse, location: sLocation);

    return await repository.selectLoadingSummary(tbWhPalletLoad);
  }
}

//04-02. 상차완료 하단 데이터 조회(상세)
class SelectLoadingListUseCase {
  final TbWhPalletLoadRepo repository;

  SelectLoadingListUseCase(this.repository);

  Future<Result<List<TbWhPalletLoad>?>> call(
      String sComps, String sWorkShop, String sLocation) async {
    TbWhPalletLoad tbWhPalletLoad =
        TbWhPalletLoad(comps: gComps, workshop: sWorkShop, location: sLocation);
    return await repository.selectLoadingList(tbWhPalletLoad);
  }
}

//04-02. 상차완료 하단 데이터 조회(상세)
class SelectLoadingListByApiUseCase {
  final PalletApi api;

  SelectLoadingListByApiUseCase(this.api);

  Future<Result<List<TbWhPalletPrint>?>> call(String sComps, String sWorkShop,
      String sLocation, int nScanPalletSeq) async {
    TbWhPallet tbWhPallet =
        TbWhPallet(comps: gComps, workshop: sWorkShop, location: sLocation);

    return await api.selectPalletLoadingList(tbWhPallet, nScanPalletSeq);
  }
}

//05. 실적 이력 삭제 전 데이터 존재여부확인
class GetPalletCountInDevice {
  final TbWhPalletRepo repository;

  GetPalletCountInDevice(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<int> call() async {
    return await repository.getTbWhPalletCountInDevice();
  }
}

//05. 상차 이력 삭제 전 데이터 존재여부확인
class GetPalletLoadCountInDevice {
  final TbWhPalletLoadRepo repository;

  GetPalletLoadCountInDevice(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<int>> call() async {
    return await repository.getTbWhPalletLoadCountInDevice();
  }
}

//00. 데이터 벨리데이션
// - 기실적여부 체크
// - 품번 유효성 체크
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
  Future<Result<List<TbWhPalletPrint>?>> call(String comps, String sWorkShop,
      String sLocation, String sPalletSeq) async {
    TbWhPallet tbWhPallet =
        TbWhPallet(comps: gComps, workshop: sWorkShop, location: sLocation);

    return await repository.selectPrintingListByApi(tbWhPallet, sPalletSeq);
  }
}

//05. 이력삭제용 조회
class SelectPalletForDeleteUseCase {
  final TbWhPalletRepo repository;

  SelectPalletForDeleteUseCase(this.repository);

  Future<Result<List<TbWhPalletForDelete>?>> call() async {
    return await repository.selectPalletForDelete();
  }
}

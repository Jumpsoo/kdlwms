import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';

abstract class TbWhPalletRepo {
  //팔렛트 시퀀스 조회
  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq);

  //01.실적입력
  Future<List<TbWhPalletGroup>?>  selectPackingSummary(TbWhPallet tbWhPallet);
  Future<List<TbWhPallet>?> selectPackingList(TbWhPallet tbWhPallet);

  //02.실적조회
  Future<List<TbWhPalletGroup>?>  selectPalletSummary(TbWhPallet tbWhPallet);
  Future<Result<List<TbWhPallet>?>> selectPalletList(TbWhPallet tbWhPallet);
  Future<Result<List<TbWhPallet>?>> selectPalletListByApi(TbWhPallet tbWhPallet, String sPalletSeq);

  //03라벨 데이터 조회
  Future<List<TbWhPalletGroup>?> selectPrintingList(TbWhPallet tbWhPallet);

  Future<Result<List<TbWhPalletPrint>?>> selectPrintingListByApi(TbWhPallet tbWhPallet, String sPalletSeq);

  //04. 상차완료
  Future<List<TbWhPalletGroup>?> selectLoadingSummary(TbWhPallet tbWhPallet);
  Future<List<TbWhPallet>?> selectLoadingList(TbWhPallet tbWhPallet);

  //05. 이력 삭제
  // 삭제용 데이터 쿼리
  Future<Result<List<TbWhPalletForDelete>?>>  selectPalletForDelete();
  Future<Result<bool>> deleteTbWhPalletByLocation(List<TbWhPalletForDelete> pallet);

  //단일행조회
  Future<Result<TbWhPallet?>> selectTbWhPalletInto(TbWhPallet tbWhPallet);
  Future<Result<bool>> selectDupleCheck(String sBarCode);

  //적재중(입력, 완료) 대상 전체 조회
  Future<int> getTbWhPalletCountInDevice();

  Future<bool> insertTbWhPallet(TbWhPallet pallet);

  Future<Result<bool>> upsertTbWhPallet(TbWhPallet pallet);

  Future<void> updateTbWhPallet(List<TbWhPallet> pallets);

  Future<Result<bool>> updateTbWhPalletState(List<TbWhPallet> pallets);

  Future<Result<bool>> deleteTbWhPallet(List<TbWhPallet> pallet);

  Future<Result<bool>> deleteTbWhPalletAll();

  // 01. 기실적여부 체크
  // 02. 품번 유효성 체크
  Future<Result<bool>> selectCheckValue(TbWhPallet pallet);

}

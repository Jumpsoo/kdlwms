import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';

abstract class TbWhPalletRepo {
  //팔렛트 시퀀스 조회
  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq);

  //01.실적입력
  Future<List<TbWhPalletGroup>?>  selectPackingSummary(TbWhPallet tbWhPallet);
  Future<List<TbWhPallet>?> selectPackingList(TbWhPallet tbWhPallet);

  //02.실적조회
  Future<List<TbWhPalletGroup>?>  selectPalletingSummary(TbWhPallet tbWhPallet);
  Future<List<TbWhPallet>?> selectPalletingList(TbWhPallet tbWhPallet);

  //03라벨 데이터 조회
  Future<List<TbWhPalletGroup>?> selectPrintingList(TbWhPallet tbWhPallet);

  //04. 상차완료
  Future<List<TbWhPalletGroup>?> selectLoadingSummary(TbWhPallet tbWhPallet);
  Future<List<TbWhPallet>?> selectLoadingList(TbWhPallet tbWhPallet);

  //단일행조회
  Future<Result<TbWhPallet?>> selectTbWhPalletInto(TbWhPallet tbWhPallet);

  Future<int> getTbWhPalletCountInDevice();

  Future<bool> insertTbWhPallet(TbWhPallet pallet);

  Future<Result<bool>> upsertTbWhPallet(TbWhPallet pallet);

  Future<void> updateTbWhPallet(List<TbWhPallet> pallets);

  Future<Result<bool>> updateTbWhPalletState(List<TbWhPallet> pallets);

  Future<bool> deleteTbWhPallet(List<TbWhPallet> pallet);

  Future<bool> deleteTbWhPalletAll();

  // 01. 기실적여부 체크
  // 02. 품번 유효성 체크
  Future<Result<bool>> selectCheckValue(TbWhPallet pallet);

}

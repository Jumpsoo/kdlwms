import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_load.dart';

abstract class TbWhPalletLoadRepo { 
  
  //상차리스트 집계
  Future<Result<List<TbWhPalletLoadGroup>?>> selectLoadingSummary(TbWhPalletLoad tbWhPalletLoad);
  //상차리스트 상세
  Future<Result<List<TbWhPalletLoad>?>> selectLoadingList(TbWhPalletLoad tbWhPalletLoad);
  //상차완료 후 삭제
  Future<Result<bool>> deleteTbWhPalletLoad(List<TbWhPalletLoad> pallet);
  //데이터 이관시 사용 ( 라벨 -> 상차)
  Future<Result<bool>> upsertTbWhPalletLoad(List<TbWhPalletLoad> pallets);
  //적재중(입력, 완료) 대상 전체 조회
  Future<Result<int>> getTbWhPalletLoadCountInDevice();
  //전체 상차이력 삭제
  Future<Result<bool>> deleteTbWhPalletLoadAll();
}

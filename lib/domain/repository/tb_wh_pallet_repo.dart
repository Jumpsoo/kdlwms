import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';

abstract class TbWhPalletRepo {
  //팔렛트 시퀀스 조회
  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq);

  //리스트 조회
  Future<List<TbWhPallet>?> selectPackingList(TbWhPallet tbWhPallet);

  //단일행조회
  Future<Result<TbWhPallet?>> selectTbWhPalletInto(TbWhPallet tbWhPallet);

  //위치별 전체 조회
  Future<List<TbWhPallet>?> selectTbWhPalletListByLocation(TbWhPallet tbWhPallet);

  //그루핑 조회
  Future<List<TbWhPalletGroup>?>  selectTbWhPalletGroup(TbWhPallet tbWhPallet);

  Future<int> getTbWhPalletCountInDevice();

  Future<List<TbWhPallet>?> selectPrintingList(int nState);

  Future<bool> insertTbWhPallet(TbWhPallet pallet);

  Future<Result<bool>> upsertTbWhPallet(TbWhPallet pallet);

  Future<void> updateTbWhPallet(List<TbWhPallet> pallets);


  Future<Result<bool>> updateTbWhPalletState(List<TbWhPallet> pallets);

  Future<bool> deleteTbWhPallet(List<TbWhPallet> pallet);

  Future<bool> deleteTbWhPalletAll();

  Future<Result<bool>> selectCheckValue(TbWhPallet pallet);

}

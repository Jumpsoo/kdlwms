import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';

abstract class TbWhPalletRepo {
  //팔렛트 시퀀스 조회
  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq);

  //리스트 조회
  Future<List<TbWhPallet>?> selectTbWhPalletList(TbWhPallet tbWhPallet);

  Future<int> getTbWhPalletCountInDevice();

  Future<List<TbWhPallet>?> selectDupleCheck(String sBarCode);

  Future<bool> insertTbWhPallet(TbWhPallet pallet);
  Future<Result<bool>> upsertTbWhPallet(TbWhPallet pallet);

  Future<void> updateTbWhPallet(List<TbWhPallet> pallets);


  Future<Result<bool>> updateTbWhPalletState(List<TbWhPallet> pallets);

  Future<bool> deleteTbWhPallet(List<TbWhPallet> pallet);

  Future<bool> deleteTbWhPalletAll();

}

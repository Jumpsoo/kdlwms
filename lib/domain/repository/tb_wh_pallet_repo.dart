import 'package:kdlwms/domain/model/tb_wh_pallet.dart';

abstract class TbWhPalletRepo {
  //팔렛트 시퀀스 조회
  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq);

  //리스트 조회
  Future<List<TbWhPallet>?> getTbWhPalletList(
      String sWorkShop, String sLocation, int nState);

  Future<bool> insertTbWhPallet(TbWhPallet pallet);

  Future<bool> deleteTbWhPallet(List<TbWhPallet> pallet);

  Future<bool> deleteTbWhPalletAll();

  Future<void> updateTbWhPallet(List<TbWhPallet> pallets);

  Future<void> updateTbWhPalletState(List<TbWhPallet> pallets);

  Future<int> getTbWhPalletCountInDevice();
}

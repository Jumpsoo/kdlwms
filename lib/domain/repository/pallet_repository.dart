import 'package:kdlwms/domain/model/pallet.dart';

abstract class PalletRepository {
  //팔렛트 시퀀스 조회
  Future<Pallet?> getPalletBySeq(int palletSeq);

  //리스트 조회
  Future<List<Pallet>?> getPalletList(
      String sWorkShop, String sLocation, int nState);

  Future<bool> insertPallet(Pallet pallet);

  Future<bool> deletePallet(List<Pallet> pallet);

  Future<void> updatePallet(List<Pallet> pallets);

  Future<void> updatePalletState(List<Pallet> pallets);
}

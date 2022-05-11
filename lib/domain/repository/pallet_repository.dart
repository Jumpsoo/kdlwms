import 'package:kdlwms/domain/model/pallet.dart';

abstract class PalletRepository {
  //팔렛트 시퀀스 조회
  Future<Pallet?> getPalletBySeq(int palletSeq);

  //리스트 조회
  Future<List<Pallet>?> getPalletList(
      String sWorkShop, String sLocation, int nState);

  Future<void> insertPallet(Pallet pallet);

  Future<void> deletePallet(Pallet pallet);

  Future<void> updatePallet(Pallet pallet);
}

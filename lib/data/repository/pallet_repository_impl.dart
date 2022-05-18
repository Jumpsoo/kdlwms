import 'dart:async';

import 'package:kdlwms/data/data_source/pallet_db_helper.dart';
import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class PalletRepositoryImpl implements PalletRepository {
  final PalletDbHelper db;

  PalletRepositoryImpl(this.db);

  @override
  Future<Pallet?> getPalletBySeq(int palletSeq) async {
    // TODO: implement getNoteBySeq
    return await db.getPalletBySeq(palletSeq);
  }

  @override
  Future<List<Pallet>?> getPalletList(
      String sWorkShop, String sLocation, int nState) async {
    // TODO: implement getPallet
    return await db.getPalletList(sWorkShop, sLocation, nState);
  }

  @override
  Future<bool> insertPallet(Pallet pallet) async {
    return await db.insertPallet(pallet);
  }

  @override
  Future<void> updatePallet(List<Pallet> pallets) async {
    for(Pallet pallet in pallets) {
      await db.updatePallet(pallet);
    }
  }

  @override
  Future<void> updatePalletState(List<Pallet> pallets) async {
    for(Pallet pallet in pallets) {
      await db.updatePalletState(pallet);
    }
  }

  @override
  Future<bool> deletePallet(List<Pallet> pallets) async {
    try{
      for(Pallet pallet in pallets) {
        await db.deletePallet(pallet);
      }
    }catch(e){
      print(e);
      return false;
    }
    return true;
  }

  @override
  Future<int> getPalletCountInDevice()  async {
    return await db.getPalletCountInDevice();
  }

  @override
  Future<bool> deletePalletAll() async {
    return await db.deletePalletAll();
  }
}

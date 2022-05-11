
import 'dart:async';

import 'package:kdlwms/data/data_source/pallet_db_helper.dart';
import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class PalletRepositoryImpl implements PalletRepository{
  final PalletDbHelper db;

  PalletRepositoryImpl(this.db);
  @override
  Future<void> deletePallet(Pallet pallet) async{
    await db.deletePallet(pallet);
  }

  @override
  Future<Pallet> getPalletBySeq(int palletSeq) async{
    // TODO: implement getNoteBySeq
    return await db.getPalletBySeq(palletSeq);
  }

  @override
  Future<List<Pallet>> getPalletList(String workShop) async{
    // TODO: implement getPallet
    return await db.getPalletList(workShop);
  }

  @override
  Future<void> insertPallet(Pallet pallet)  async{
     await db.insertPallet(pallet);
  }

  @override
  Future<void> updatePallet(Pallet pallet)  async {
    // TODO: implement updatePallet
    await db.updatePallet(pallet);
  }
  
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/tb_wh_pallet_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

class TbWhPalletRepoImpl implements TbWhPalletRepo {
  final TbWhPalletDbHelper db;

  TbWhPalletRepoImpl(this.db);

  @override
  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq) async {
    // TODO: implement getNoteBySeq
    return await db.getTbWhPalletBySeq(palletSeq);
  }

  @override
  Future<List<TbWhPallet>?> getTbWhPalletList(
      String sWorkShop, String sLocation, int nState) async {
    // TODO: implement getPallet
    return await db.getTbWhPalletList(sWorkShop, sLocation, nState);
  }

  @override
  Future<List<TbWhPallet>?> selectDupleCheck(String sBarCode) async{
    return await db.selectDupleCheck(sBarCode);

  }

  @override
  Future<bool> insertTbWhPallet(TbWhPallet pallet) async {
    return await db.insertTbWhPallet(pallet);
  }

  @override
  Future<void> updateTbWhPallet(List<TbWhPallet> pallets) async {
    for(TbWhPallet pallet in pallets) {
      await db.updateTbWhPallet(pallet);
    }
  }

  @override
  Future<void> updateTbWhPalletState(List<TbWhPallet> pallets) async {
    for(TbWhPallet pallet in pallets) {
      await db.updateTbWhPalletState(pallet);
    }
  }

  @override
  Future<bool> deleteTbWhPallet(List<TbWhPallet> pallets) async {
    try{
      for(TbWhPallet pallet in pallets) {
        await db.deleteTbWhPallet(pallet);
      }
    }catch(e){
      print(e);
      return false;
    }
    return true;
  }

  @override
  Future<int> getTbWhPalletCountInDevice()  async {
    return await db.getTbWhPalletCountInDevice();
  }

  @override
  Future<bool> deleteTbWhPalletAll() async {
    return await db.deleteTbWhPalletAll();
  }
}

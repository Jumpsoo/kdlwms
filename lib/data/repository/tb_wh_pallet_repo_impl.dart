import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/pallet_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/data_source/tb_wh_pallet_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

class TbWhPalletRepoImpl implements TbWhPalletRepo {
  final TbWhPalletDbHelper db;

  TbWhPalletRepoImpl(this.db);

  @override
  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq) async {
    // TODO: implement getNoteBySeq
    return await db.getTbWhPalletBySeq(palletSeq);
  }

  @override
  Future<List<TbWhPallet>?> selectTbWhPalletList(TbWhPallet tbWhPallet) async {
    // TODO: implement getPallet
    return await db.selectTbWhPalletList(tbWhPallet);
  }

  @override
  Future<List<TbWhPallet>?> selectDupleCheck(String sBarCode) async {
    return await db.selectDupleCheck(sBarCode);
  }

  @override
  Future<bool> insertTbWhPallet(TbWhPallet pallet) async {
    return await db.updateTbWhPallet(pallet);
  }

  @override
  Future<Result<bool>> upsertTbWhPallet(TbWhPallet pallet) async {
    return await db.upsertPallet(pallet);
  }

  @override
  Future<void> updateTbWhPallet(List<TbWhPallet> pallets) async {
    for (TbWhPallet pallet in pallets) {
      await db.updateTbWhPallet(pallet);
    }
  }

  @override
  Future<Result<bool>> updateTbWhPalletState(List<TbWhPallet> pallets) async {
    Result result ;
    for (TbWhPallet pallet in pallets) {
      result = await db.updateTbWhPalletState(pallet);
      result.when(success: (value){}, error: (message){
        return Result.success(message);
      });
    }
    return const Result.success(true);
  }

  @override
  Future<bool> deleteTbWhPallet(List<TbWhPallet> pallets) async {
    try {
      for (TbWhPallet pallet in pallets) {
        await db.deleteTbWhPallet(pallet);
      }
    } catch (e) {
      writeLog(e.toString());
      return false;
    }
    return true;
  }

  @override
  Future<int> getTbWhPalletCountInDevice() async {
    return await db.getTbWhPalletCountInDevice();
  }

  @override
  Future<bool> deleteTbWhPalletAll() async {
    return await db.deleteTbWhPalletAll();
  }
}

import 'dart:async';

import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/data_source/tb_wh_pallet_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

class TbWhPalletRepoImpl implements TbWhPalletRepo {
  final TbWhPalletDbHelper db;

  TbWhPalletRepoImpl(this.db);

  @override
  Future<List<TbWhPalletGroup>?> selectPackingSummary(
      TbWhPallet tbWhPallet) async {
    return await db.selectPackingSummary(tbWhPallet);
  }

  @override
  Future<List<TbWhPallet>?> selectPackingList(TbWhPallet tbWhPallet) async {
    // TODO: implement getPallet
    return await db.selectPackingList(tbWhPallet);
  }

  @override
  Future<List<TbWhPalletGroup>?> selectPalletingSummary(
      TbWhPallet tbWhPallet) async {
    return await db.selectPalletingSummary(tbWhPallet);
  }

  @override
  Future<List<TbWhPallet>?> selectPalletingList(TbWhPallet tbWhPallet) async {
    return await db.selectPalletingList(tbWhPallet);
  }

  @override
  Future<List<TbWhPalletGroup>?> selectPrintingList(TbWhPallet tbWhPallet) async {
    return await db.selectPrintingList(tbWhPallet);
  }

  @override
  Future<List<TbWhPallet>?> selectLoadingList(TbWhPallet tbWhPallet) async {
    // TODO: implement getPallet
    return await db.selectLoadingList(tbWhPallet);
  }

  @override
  Future<List<TbWhPalletGroup>?> selectLoadingSummary(
      TbWhPallet tbWhPallet) async {
    return await db.selectLoadingSummary(tbWhPallet);
  }

  @override
  Future<Result<TbWhPallet?>> selectTbWhPalletInto(
      TbWhPallet tbWhPallet) async {
    // TODO: implement getPallet
    return await db.selectTbWhPalletInto(tbWhPallet);
  }

  @override
  Future<Result<bool>> selectDupleCheck(String sBarCode) async {
    List<TbWhPallet>? retList = await db.selectDupleCheck(sBarCode);

    if (retList != null && retList.isNotEmpty) {
      return Result.error('이미 입력 한 식별표입니다.');
    } else {
      return Result.success(true);
    }
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
    Result result;
    for (TbWhPallet pallet in pallets) {
      result = await db.updateTbWhPalletState(pallet);
      result.when(
          success: (value) {},
          error: (message) {
            return Result.success(message);
          });
    }
    return const Result.success(true);
  }

  @override
  Future<bool> deleteTbWhPallet(List<TbWhPallet> pallets) async {
    try {
      for (TbWhPallet pallet in pallets) {
        db.deleteTbWhPallet(pallet);
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

  @override
  Future<Result<bool>> selectCheckValue(TbWhPallet pallet) async {
    return await db.selectCheckValue(pallet);
  }

  @override
  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq) async {
    // TODO: implement getNoteBySeq
    return await db.getTbWhPalletBySeq(palletSeq);
  }
}

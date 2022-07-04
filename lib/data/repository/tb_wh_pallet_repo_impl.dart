import 'dart:async';

import 'package:kdlwms/data/data_source/pallet_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/data_source/tb_wh_cm_code_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_wh_pallet_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class TbWhPalletRepoImpl implements TbWhPalletRepo {
  final TbWhCmCodeDbHelper dbCode;
  final TbWhPalletDbHelper db;
  final PalletApi api ;

  TbWhPalletRepoImpl(this.db, this.dbCode, this.api);

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
  Future<Result<List<TbWhPallet>?>> selectPalletingList(
      TbWhPallet tbWhPallet) async {
    return await db.selectPalletingList(tbWhPallet);
  }

  @override
  Future<Result<List<TbWhPallet>?>> selectPalletingListByApi(
      TbWhPallet tbWhPallet, String sPalletSeq) async {
    return await api.selectPalletListByApi(tbWhPallet, sPalletSeq);
  }

  @override
  Future<List<TbWhPalletGroup>?> selectPrintingList(
      TbWhPallet tbWhPallet) async {
    return await db.selectPrintingList(tbWhPallet);
  }


  @override
  Future<Result<List<TbWhPalletPrint>?>> selectPrintingListByApi(
      TbWhPallet tbWhPallet, String sPalletSeq) async {

    return await api.selectPalletPrintingList(tbWhPallet, sPalletSeq);
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
  Future<Result<bool>> deleteTbWhPallet(List<TbWhPallet> pallets) async {
    late Result result;
    try {
      for (TbWhPallet pallet in pallets) {
        result = await db.deleteTbWhPallet(pallet);
        result.when(
            success: (value) {},
            error: (message) {
              return Result.error(message);
            });
      }
    } catch (e) {
      var  sErrMsg = '에러 발생 : deleteTbWhPallet (repo)';
      writeLog(sErrMsg);
      return Result.error(sErrMsg);
    }
    return const Result.success(true);
  }

  @override
  Future<int> getTbWhPalletCountInDevice() async {
    return await db.getTbWhPalletCountInDevice();
  }

  @override
  Future<Result<bool>> deleteTbWhPalletAll() async {
    return await db.deleteTbWhPalletAll();
  }

  @override
  Future<Result<bool>> selectCheckValue(TbWhPallet pallet) async {

    String sWarehouseCd = '';

    //공통코드 조회 후 값전달 체크되지 않으면 2품체크 패스하라고 함(미설정시)
    TbWhCmCode tbWhCmCode =  TbWhCmCode(comps: gComps, grpCd: 'LOCATION', codeCd: pallet.location);
    Result result = await dbCode.selectTbWhCmCodeListByCodeCd(tbWhCmCode);

    result.when(success: (valueList) async {
      List<TbWhCmCode> codeList = valueList;
      if(codeList.isNotEmpty){
        sWarehouseCd = codeList[0].ref2!;
      }
    }, error: (message){
      return Result.error(message);
    });

    return await db.selectCheckValue(pallet,sWarehouseCd);

  }

  @override
  Future<TbWhPallet?> getTbWhPalletBySeq(int palletSeq) async {
    // TODO: implement getNoteBySeq
    return await db.getTbWhPalletBySeq(palletSeq);
  }
}

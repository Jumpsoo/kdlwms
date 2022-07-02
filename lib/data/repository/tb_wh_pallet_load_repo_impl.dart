import 'dart:async';

import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/data_source/tb_wh_pallet_load_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_load.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_load_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

class TbWhPalletLoadRepoImpl implements TbWhPalletLoadRepo {
  final TbWhPalletLoadDbHelper db;

  TbWhPalletLoadRepoImpl(this.db);

  @override
  Future<Result<List<TbWhPalletLoadGroup>?>> selectLoadingSummary(TbWhPalletLoad tbWhPalletLoad) async {
    try{
      return await db.selectLoadingSummary(tbWhPalletLoad);
    }catch(_){
      writeLog('데이터 베이스 에러 발생(selectLoadingSummary)');
      return const Result.error('데이터 베이스 에러 발생(selectLoadingSummary)');
    }
  }

  @override
  Future<Result<List<TbWhPalletLoad>?>> selectLoadingList(TbWhPalletLoad tbWhPalletLoad) async {
    try{
      return await db.selectLoadingList(tbWhPalletLoad);
    }catch(_){
      writeLog('데이터 베이스 에러 발생(selectLoadingSummary)');
      return const Result.error('데이터 베이스 에러 발생(selectLoadingSummary)');
    }
  }

  @override
  Future<Result<bool>> upsertTbWhPalletLoad(List<TbWhPalletLoad> pallets) async {
    late Result result ;
    try{
      for(TbWhPalletLoad item in pallets){
        result = await db.upsertPalletLoad(item);
        result.when(success: (value){},  error: (message){
          return Result.error(message);
        });
      }
    }catch(_){
      return const Result.error('데이터베이스 에러발생');
    }
    return const Result.success(true);
  }

  @override
  Future<Result<bool>> deleteTbWhPalletLoad(List<TbWhPalletLoad> pallets) async {
    late Result result ;
    try {

      for (TbWhPalletLoad pallet in pallets) {
        result = await db.deleteTbWhPalletLoad(pallet);
        result.when(success: (value){}, error: (message){
          return Result.success(message);
        });
      }
    } catch (_) {
      return const Result.error('데이터 베이스 에러 발생');
    }
    return const Result.success(true);
  }

  //상차이력 대상 전체 조회
  @override
  Future<Result<int>> getTbWhPalletLoadCountInDevice() async{
    return await db.getTbWhPalletLoadCountInDevice();
  }

  //전체 상차이력 삭제
  @override
  Future<Result<bool>> deleteTbWhPalletLoadAll() async{
    return await db.deleteTbWhPalletLoadAll();

  }
}

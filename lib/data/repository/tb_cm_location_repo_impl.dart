import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/data_source/tb_cm_location_db_helper.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';

class TbCmLocationRepoImpl implements TbCmLocationRepo {
  final TbCmLocationDbHelper db;

  TbCmLocationRepoImpl(this.db);

  @override
  //전체 작업장 리스트 조회
  Future<Result<List<TbCmLocation>?>> selectTbCmLocationListAll() async {
    return await db.selectTbCmLocationListAll();
  }

  @override
  //전체 작업장 리스트 조회
  Future<Result<TbCmLocation?>> selectTbCmLocationCurrentItem() async {
    return await db.selectTbCmLocationCurrentItem();
  }

  @override
  Future<Result<List<TbCmLocation>?>> selectTbCmLocationList(
      TbCmLocation tbCmLocation) async {
    return await db.selectTbCmLocationList(tbCmLocation);
  }

  @override
  Future<Result<bool>> updateTbCmLocation(TbCmLocation tbCmLocation) async {
    return await db.updateTbCmLocation(tbCmLocation);
  }

  @override
  Future<Result<bool>> updateFromSelectTbCmLocationToEnable(
      String sWorkSHop) async {
    dynamic retVal;

    Result result = await updateFromSelectTbCmLocationToDisableAll();
    result.when(success: (value) async {
      result = await db.updateFromSelectTbCmLocationToEnable(sWorkSHop);
      result.when(
          success: (value) {
            retVal = value;
          },
          error: (innerMessage) {
            return Result.error(innerMessage);
          });
    }, error: (message) {
      return Result.error(message);
    });
    return Result.success(retVal);
  }

  @override
  Future<Result<bool>> updateFromSelectTbCmLocationToDisableAll() async {
    return await db.updateFromSelectTbCmLocationToDisableAll();
  }

  @override
  Future<Result<bool>> insertTbCmLocation(TbCmLocation tbCmLocation) async {
    return await db.insertTbCmLocation(tbCmLocation);
  }

  @override
  Future<Result<bool>> upsertTbCmLocation(List<TbCmLocation> tbCmLocationList) async {
    bool bRet = false;
    for(TbCmLocation item in tbCmLocationList){

      //있으면 수정 없으면 등록
      Result result = await db.upsertTbCmLocation(item);

      result.when(success: (value){
        bRet = true;
        return Result.success(bRet);
      }, error: (message){
        bRet = false;
        return Result.error(message);
      });
    }
    return Result.success(bRet);
  }

  @override
  Future<Result<bool>> deleteTbCmLocation(TbCmLocation tbCmLocation) async {
    return await db.deleteTbCmLocation(tbCmLocation);
  }

  @override
  Future<Result<bool>> deleteTbCmLocationAllBySetFlag(String setFlag) async {
    return await db.deleteTbCmLocationAll(setFlag);
  }
}


import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';

abstract class TbCmLocationRepo{

  Future<Result<List<TbCmLocation>?>> selectTbCmLocationListAll();
  Future<Result<TbCmLocation?>> selectTbCmLocationCurrentItem();
  Future<Result<List<TbCmLocation>?>> selectTbCmLocationList(TbCmLocation tbCmLocation);

  Future<Result<bool>> updateTbCmLocation(TbCmLocation tbCmLocation);
  Future<Result<bool>> updateFromSelectTbCmLocationToEnable(String sWorkSHop);
  Future<Result<bool>> updateFromSelectTbCmLocationToDisableAll();

  Future<Result<bool>> insertTbCmLocation(TbCmLocation tbCmLocation);
  Future<Result<bool>> upsertTbCmLocation(List<TbCmLocation> tbCmLocations);
  Future<Result<bool>> deleteTbCmLocation(TbCmLocation tbCmLocation);
  Future<Result<bool>> deleteTbCmLocationAllBySetFlag(String setFlag);


}
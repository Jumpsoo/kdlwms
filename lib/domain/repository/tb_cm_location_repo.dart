
import 'package:kdlwms/domain/model/tb_cm_location.dart';

abstract class TbCmLocationRepo{

  Future<List<TbCmLocation>?> selectTbCmLocationListAll();
  Future<List<TbCmLocation>?> selectTbCmLocationList(TbCmLocation tbCmLocation);

  Future<bool> updateTbCmLocation(TbCmLocation tbCmLocation);
  Future<bool> insertTbCmLocation(TbCmLocation tbCmLocation);
  Future<bool> deleteTbCmLocation(TbCmLocation tbCmLocation);

  Future<bool> deleteTbCmLocationAll();

}
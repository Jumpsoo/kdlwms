
import 'package:kdlwms/domain/model/tb_cm_location.dart';

abstract class TbCmLocationRepo{

  Future<List<TbCmLocation>?> getTbCmLocationList();

  Future<bool> updateTbCmLocation(TbCmLocation tbCmLocation);
  Future<bool> insertTbCmLocation(TbCmLocation tbCmLocation);
  Future<bool> deleteTbCmLocation(TbCmLocation tbCmLocation);
}
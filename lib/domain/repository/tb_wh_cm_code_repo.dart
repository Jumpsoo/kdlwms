
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';

abstract class TbWhCmCodeRepo{

  //리스트 조회
  Future<List<TbWhCmCode>?> getTbWhCmCodeList();

  Future<bool> insertTbWhCmCode(TbWhCmCode tbWhCmCode);
  Future<bool> updateTbWhCmCode(TbWhCmCode tbWhCmCode);
  Future<bool> deleteTbWhCmCode(TbWhCmCode tbWhCmCode);
  Future<bool> deleteTbWhCmCodeAll();
  
}
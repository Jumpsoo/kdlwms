import 'package:kdlwms/domain/model/tb_wh_item.dart';

abstract class TbWhItemRepo{
  //리스트 조회
  Future<List<TbWhItem>?> getTbWhItemList();

  Future<bool> updateTbWhItem(TbWhItem tbWhItem);
  Future<bool> insertTbWhItem(TbWhItem tbWhItem);
  Future<bool> deleteTbWhItem(TbWhItem tbWhItem);
}
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';

abstract class TbWhItemRepo{
  //배치용 use case
  Future<Result<List<TbWhItem>?>> getTbWhItemList();
  Future<Result<bool>> updateTbWhItem(TbWhItem tbWhItem);
  Future<Result<bool>> insertTbWhItem(TbWhItem tbWhItem);
  Future<Result<bool>> deleteAndInsertTbWhItemBatch(List<TbWhItem> tbWhItem);
  Future<Result<bool>> deleteTbWhItem(TbWhItem tbWhItem);
  Future<Result<bool>> deleteTbWhItemAll();

  Future<Result<TbWhItem?>> selectTbWhItem(TbWhItem tbWhItem);

}

import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';

abstract class ItemRcvRepoApi {
  Future<Result<List<TbWhItem>>> selectItemList(String query);
}
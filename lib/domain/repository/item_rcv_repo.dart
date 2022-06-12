
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';

abstract class ItemRcvRepo {
  Future<Result<List<TbWhItem>>> selectItemList(String query);
}
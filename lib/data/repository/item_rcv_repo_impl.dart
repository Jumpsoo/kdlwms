import 'package:kdlwms/data/data_source/item_rcv_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/repository/item_rcv_repo.dart';

class ItemRcvRepoApiImpl implements ItemRcvRepoApi {
  ItemRcvApi api = ItemRcvApi();

  @override
  Future<Result<List<TbWhItem>>> selectItemList(String query) async {

    final Result<Iterable> result = await api.selectItemList(query);

    return result.when(
        success: (iterable) {

      return Result.success(iterable.map((e) => TbWhItem.fromJson(e)).toList());
    }, error: (message) {
          return Result.error(message);
    });
  }
}

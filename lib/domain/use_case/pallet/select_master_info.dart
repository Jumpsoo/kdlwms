import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/repository/tb_wh_item_repo_impl.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';

class SelectItemList {
  final TbWhItemRepoImpl repository;

  SelectItemList(this.repository);

  Future<Result<List<TbWhItem>?>> call() async {
    return await repository.getTbWhItemList();
  }
}


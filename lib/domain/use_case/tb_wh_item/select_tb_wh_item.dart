
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/repository/tb_wh_item_repo.dart';

class SelectTbWhItem{

  final TbWhItemRepo repository;
  SelectTbWhItem(this.repository);

  Future<Result<TbWhItem?>> call (TbWhItem tbWhItem) async {

    return await repository.selectTbWhItem(tbWhItem);
  }
}


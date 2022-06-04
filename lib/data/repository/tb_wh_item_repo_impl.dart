

import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/data_source/tb_wh_item_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/repository/tb_wh_item_repo.dart';

class TbWhItemRepoImpl implements TbWhItemRepo{

  final TbWhItemDbHelper db;
  TbWhItemRepoImpl(this.db);

  @override
  Future<Result<List<TbWhItem>?>> getTbWhItemList() async {
    return await db.getTbWhItemList();
  }

  @override
  Future<Result<bool>> insertTbWhItem(TbWhItem tbWhItem) async {
    return await db.insertTbWhItem(tbWhItem);
  }

  @override
  Future<Result<bool>> updateTbWhItem(TbWhItem tbWhItem) async {
    return await db.updateTbWhItem(tbWhItem);
  }

  @override
  Future<Result<bool>> deleteTbWhItem(TbWhItem tbWhItem) async {
    return await db.deleteTbWhItem(tbWhItem);
  }

  @override
  Future<Result<bool>> deleteTbWhItemAll() async {
    return await db.deleteTbWhItemAll();
  }
}
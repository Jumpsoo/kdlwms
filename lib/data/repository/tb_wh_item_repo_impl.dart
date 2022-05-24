

import 'package:kdlwms/data/data_source/tb_wh_item_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/repository/tb_wh_item_repo.dart';

class TbWhItemRepoImpl implements TbWhItemRepo{

  final TbWhItemDbHelper db;
  TbWhItemRepoImpl(this.db);

  @override
  Future<bool> deleteTbWhItem(TbWhItem tbWhItem) async {
    return await db.deleteTbWhItem(tbWhItem);
  }

  @override
  Future<List<TbWhItem>?> getTbWhItemList() async {
    return await db.getTbWhItemList();
  }

  @override
  Future<bool> insertTbWhItem(TbWhItem tbWhItem) async {
    return await db.insertTbWhItem(tbWhItem);
  }

  @override
  Future<bool> updateTbWhItem(TbWhItem tbWhItem) async {
    return await db.updateTbWhItem(tbWhItem);
  }
}
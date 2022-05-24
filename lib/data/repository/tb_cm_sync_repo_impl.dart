

import 'package:kdlwms/data/data_source/tb_cm_location_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_cm_sync_db_helper.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/repository/tb_cm_sync_repo.dart';

class TbCmSyncRepoImpl implements TbCmSyncRepo{

  final TbCmSyncDbHelper db;
  TbCmSyncRepoImpl(this.db);

  @override
  Future<bool> deletetbCmSync(TbCmSync tbCmSync) async {
    return await db.deleteTbCmSync(tbCmSync);
  }

  @override
  Future<List<TbCmSync>?> getTbCmSyncList()  async{
    return await db.getTbCmSyncList();
  }

  @override
  Future<bool> inserttbCmSync(TbCmSync tbCmSync) async {
    return await db.insertTbCmSync(tbCmSync);
  }

  @override
  Future<bool> updatetbCmSync(TbCmSync tbCmSync) async {
    return await db.updateTbCmSync(tbCmSync);
  }

}
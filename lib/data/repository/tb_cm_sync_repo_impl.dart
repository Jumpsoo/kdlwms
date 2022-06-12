

import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/data_source/tb_cm_location_db_helper.dart';
import 'package:kdlwms/data/data_source/tb_cm_sync_db_helper.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/repository/tb_cm_sync_repo.dart';

class TbCmSyncRepoImpl implements TbCmSyncRepo{

  final TbCmSyncDbHelper db;
  TbCmSyncRepoImpl(this.db);

  @override
  Future<Result<List<TbCmSync>?>> getTbCmSyncList()  async{
    return await db.getTbCmSyncList();
  }

  @override
  Future<Result<TbCmSync?>> getCurrentVersionRow()  async{
    return await db.getCurrentVersionRow();
  }

  @override
  Future<Result<bool>> insertTbCmSync(TbCmSync tbCmSync) async {
    return await db.insertTbCmSync(tbCmSync);
  }

  @override
  Future<Result<bool>> updateTbCmSync(TbCmSync tbCmSync) async {
    return await db.updateTbCmSync(tbCmSync);
  }


  @override
  Future<Result<bool>> deleteTbCmSync(TbCmSync tbCmSync) async {
    return await db.deleteTbCmSync(tbCmSync);
  }

  @override
  Future<Result<bool>> deleteTbCmSyncAll() async {
    return await db.deleteTbCmSyncAll();
  }
}
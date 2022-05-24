

import 'package:kdlwms/data/data_source/tb_cm_location_db_helper.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';

class TbCmLocationRepoImpl implements TbCmLocationRepo{

  final TbCmLocationDbHelper db;
  TbCmLocationRepoImpl(this.db);

  @override
  Future<List<TbCmLocation>?> getTbCmLocationList() async {
    return await db.getTbCmLocationList();
  }

  @override
  Future<bool> updateTbCmLocation(TbCmLocation tbCmLocation) async {
    return await db.updateTbCmLocation(tbCmLocation);
  }

  @override
  Future<bool> insertTbCmLocation(TbCmLocation tbCmLocation) async {
    return await db.insertTbCmLocation(tbCmLocation);
  }

  @override
  Future<bool> deleteTbCmLocation(TbCmLocation tbCmLocation)async {
    return await db.deleteTbCmLocation(tbCmLocation);
  }
}
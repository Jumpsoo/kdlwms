

import 'package:kdlwms/data/data_source/tb_cm_location_db_helper.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';

class TbCmLocationRepoImpl implements TbCmLocationRepo{

  final TbCmLocationDbHelper db;
  TbCmLocationRepoImpl(this.db);

  @override
  //전체 작업장 리스트 조회
  Future<List<TbCmLocation>?> selectTbCmLocationListAll() async {
    return await db.selectTbCmLocationListAll();
  }

  @override
  Future<List<TbCmLocation>?> selectTbCmLocationList(TbCmLocation tbCmLocation) async {
    return await db.selectTbCmLocationList(tbCmLocation);
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
  Future<bool> deleteTbCmLocation(TbCmLocation tbCmLocation) async {
    return await db.deleteTbCmLocation(tbCmLocation);
  }

  @override
  Future<bool> deleteTbCmLocationAll() async {
    return await db.deleteTbCmLocationAll();
  }

}


import 'package:kdlwms/data/data_source/tb_wh_cm_code_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';

class TbWhCmCodeRepoImpl implements TbWhCmCodeRepo{

  final TbWhCmCodeDbHelper db;
  TbWhCmCodeRepoImpl(this.db);

  @override
  Future<List<TbWhCmCode>?> getTbWhCmCodeList() async {
    return await db.getTbWhCmCodeList();
  }

  @override
  Future<bool> insertTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    return await db.insertTbWhCmCode(tbWhCmCode);
  }

  @override
  Future<bool> updateTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    return await db.updateTbWhCmCode(tbWhCmCode);
  }

  @override
  Future<bool> deleteTbWhCmCode(TbWhCmCode tbWhCmCode) async {
    return await db.deleteTbWhCmCode(tbWhCmCode);
  }

  @override
  Future<bool> deleteTbWhCmCodeAll() async {
    return await db.deleteTbWhCmCodeAll();
  }



}
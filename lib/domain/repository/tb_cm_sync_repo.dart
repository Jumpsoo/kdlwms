
import 'package:kdlwms/domain/model/tb_cm_sync.dart';

abstract class TbCmSyncRepo{

  Future<List<TbCmSync>?> getTbCmSyncList();

  Future<bool> updateTbCmSync(TbCmSync tbCmSync);
  Future<bool> insertTbCmSync(TbCmSync tbCmSync);
  Future<bool> deleteTbCmSync(TbCmSync tbCmSync);
  Future<bool> deleteTbCmSyncAll();
}
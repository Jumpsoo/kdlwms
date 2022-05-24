
import 'package:kdlwms/domain/model/tb_cm_sync.dart';

abstract class TbCmSyncRepo{

  Future<List<TbCmSync>?> getTbCmSyncList();

  Future<bool> updatetbCmSync(TbCmSync tbCmSync);
  Future<bool> inserttbCmSync(TbCmSync tbCmSync);
  Future<bool> deletetbCmSync(TbCmSync tbCmSync);
}
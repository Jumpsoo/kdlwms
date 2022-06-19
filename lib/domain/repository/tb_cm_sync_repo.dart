
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';

abstract class TbCmSyncRepo{

  Future<Result<List<TbCmSync>?>> getTbCmSyncList();
  Future<Result<TbCmSync?>> getLastSyncInfo();

  Future<Result<bool>> updateTbCmSync(TbCmSync tbCmSync);
  Future<Result<bool>> insertTbCmSync(TbCmSync tbCmSync);
  Future<Result<bool>> mergeTbCmSync(TbCmSync tbCmSync);

  Future<Result<bool>> deleteTbCmSync(TbCmSync tbCmSync);
  Future<Result<bool>> deleteTbCmSyncAll();
}
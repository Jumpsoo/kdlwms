
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';

abstract class PalletApiRepository {

  Future<Result<List<TbWhPallet>>> fetch(String query);

  Future<Result<List<TbWhPallet>>> saveInfo(String query);
  Future<Result<List<TbWhPallet>>>  deleteInfo(String query);
  Future<Result<List<TbWhPallet>>>  saveList(String query);
  Future<Result<List<TbWhPallet>>>  deleteList(String query);
}
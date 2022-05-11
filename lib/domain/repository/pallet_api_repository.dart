
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/pallet.dart';

abstract class PalletApiRepository {

  Future<Result<List<Pallet>>> fetch(String query);

  Future<Result<List<Pallet>>> saveInfo(String query);
  Future<Result<List<Pallet>>>  deleteInfo(String query);
  Future<Result<List<Pallet>>>  saveList(String query);
  Future<Result<List<Pallet>>>  deleteList(String query);
}
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';

class SelectTbCmLocation{
  final TbCmLocationRepo repository;

  SelectTbCmLocation(this.repository);

  Future<Result<List<TbCmLocation>?>> call (TbCmLocation tbCmLocation) async {
    return await repository.selectTbCmLocationList(tbCmLocation);
  }
}

class SelectTbCmLocationAll{
  final TbCmLocationRepo repository;

  SelectTbCmLocationAll(this.repository);

  Future<Result<List<TbCmLocation>?>> call () async {
    return await repository.selectTbCmLocationListAll();
  }
}

class SelectTbCmLocationCurrentItem{
  final TbCmLocationRepo repository;

  SelectTbCmLocationCurrentItem(this.repository);

  Future<Result<TbCmLocation?>> call () async {
    return await repository.selectTbCmLocationCurrentItem();
  }
}
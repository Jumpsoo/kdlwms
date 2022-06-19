import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';


class UpdateTbCmLocation {

  final TbCmLocationRepo repository;
  UpdateTbCmLocation(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(TbCmLocation tbCmLocation) async {
    return await repository.updateTbCmLocation(tbCmLocation);
  }
}

class UpdateFromSelectTbCmLocationToEnable {

  final TbCmLocationRepo repository;
  UpdateFromSelectTbCmLocationToEnable(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(String sWorkShop ) async {
    return await repository.updateFromSelectTbCmLocationToEnable(sWorkShop);
  }
}

class UpdateFromSelectTbCmLocationToDisableAll {

  final TbCmLocationRepo repository;
  UpdateFromSelectTbCmLocationToDisableAll(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call() async {
    return await repository.updateFromSelectTbCmLocationToDisableAll();
  }
}


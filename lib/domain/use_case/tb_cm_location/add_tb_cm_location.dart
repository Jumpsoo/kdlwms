import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';


class AddTbCmLocation {

  final TbCmLocationRepo repository;
  AddTbCmLocation(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(TbCmLocation tbCmLocation) async {
    return await repository.insertTbCmLocation(tbCmLocation);
  }
}

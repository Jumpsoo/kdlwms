import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';


class UpdateTbCmLocation {

  final TbCmLocationRepo repository;
  UpdateTbCmLocation(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<bool> call(TbCmLocation tbCmLocation) async {
    return await repository.updateTbCmLocation(tbCmLocation);
  }
}

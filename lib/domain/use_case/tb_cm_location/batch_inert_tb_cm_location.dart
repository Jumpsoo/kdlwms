import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';


class BatchInsertTbCmLocation {

  final TbCmLocationRepo repository;
  BatchInsertTbCmLocation(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<bool> call(List<TbCmLocation> tbCmLocations) async {
    //삭제 후 등록
    await repository.deleteTbCmLocationAll();
    //등록
    for(TbCmLocation item in tbCmLocations){
      await repository.insertTbCmLocation(item);
    }
    return true;
  }
}

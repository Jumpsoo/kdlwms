
// 배치명 : 공통코드 전체 덮어쓰기
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';

class MigTbCmLocation {
  final TbCmLocationRepo repository;
  MigTbCmLocation(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<bool> call(List<TbCmLocation> tbWhCmCodes) async {
    if(await repository.deleteTbCmLocationAll() == false){
      return false;
    }
    for(TbCmLocation item in tbWhCmCodes){
      if(await repository.insertTbCmLocation(item) == false){
        return false;
      }
    }
    return true;
  }
}

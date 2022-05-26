import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';

// 배치명 : 공통코드 전체 덮어쓰기
class MigTbWhCmCode {
  final TbWhCmCodeRepo repository;
  MigTbWhCmCode(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<bool> call(List<TbWhCmCode> tbWhCmCodes) async {
    if(await repository.deleteTbWhCmCodeAll() == false){
      return false;
    }
    for(TbWhCmCode item in tbWhCmCodes){
      if(await repository.insertTbWhCmCode(item) == false){
        return false;
      }
    }
    return true;
  }
}

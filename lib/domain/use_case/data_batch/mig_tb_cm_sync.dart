import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/repository/tb_cm_sync_repo.dart';

// 배치명 : 동기화정보 전체 덮어쓰기
class MigTbCmSync {
  final TbCmSyncRepo repository;
  MigTbCmSync(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<bool> call(List<TbCmSync> tbWhCmCodes) async {
    //삭제
    if(await repository.deleteTbCmSyncAll() == false){
      return false;
    }
    //복사사
   for(TbCmSync item in tbWhCmCodes){
      if(await repository.insertTbCmSync(item) == false){
        return false;
      }
    }
    return true;
  }
}

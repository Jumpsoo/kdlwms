import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/repository/tb_cm_sync_repo.dart';

// 배치명 : 동기화정보 전체 덮어쓰기
class MigTbCmSync {
  final TbCmSyncRepo repository;

  MigTbCmSync(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(List<TbCmSync> tbWhCmCodes) async {
    //삭제
    Result result = await repository.deleteTbCmSyncAll();
    result.when(
        success: (value) {},
        error: (message) {
          Result.error(message);
        });

    //복사사
    for (TbCmSync item in tbWhCmCodes) {
      result = await repository.insertTbCmSync(item);
      result.when(
          success: (value) {},
          error: (message) {
            Result.error(message);
          });
    }
    return const Result.success(true);
  }
}

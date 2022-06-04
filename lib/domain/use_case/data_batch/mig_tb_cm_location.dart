// 배치명 : 공통코드 전체 덮어쓰기
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';

class MigTbCmLocation {
  final TbCmLocationRepo repository;

  MigTbCmLocation(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(List<TbCmLocation> tbWhCmCodes) async {

    Result result = await repository.deleteTbCmLocationAll();
    result.when(success: (value) {}, error: (message) {
      Result.error(message);
    });
print('tbWhCmCodes');
    print(tbWhCmCodes);
    for (TbCmLocation item in tbWhCmCodes) {
      result = await repository.insertTbCmLocation(item);
      result.when(success: (value) {}, error: (message) {
        return Result.error(message);
      });
    }
    print('success');
    return const Result.success(true);
  }
}

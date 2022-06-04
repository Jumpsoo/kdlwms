import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';

// 배치명 : 공통코드 전체 덮어쓰기
class MigTbWhCmCode {
  final TbWhCmCodeRepo repository;

  MigTbWhCmCode(this.repository);

  //기존데이터 삭제 -> 재등록
  Future<Result<String>> call(List<TbWhCmCode> tbWhCmCodes, String sBatchName) async {

    Result result = await repository.deleteTbWhCmCodeAll();
    result.when(success: (value) {
    }, error: (message) {
      Result.error(message);
    });

    for (TbWhCmCode item in tbWhCmCodes) {
      result = await repository.insertTbWhCmCode(item);
      result.when(
          success: (value) {
          },
          error: (message) {
            return Result.error(message);
          })!;
    }
    return Result.success('$sBatchName 수신 성공');
  }
}

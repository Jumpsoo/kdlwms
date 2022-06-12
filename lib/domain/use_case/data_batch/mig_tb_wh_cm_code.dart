import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';

// 배치명 : 공통코드 전체 덮어쓰기
class MigTbWhCmCode {
  final TbWhCmCodeRepo repository;

  MigTbWhCmCode(this.repository);

  //기존데이터 삭제 -> 재등록
  Future<Result<String>> call(TbWhCmCode tbWhCmCode, String sBatchName) async {

    // 서비스 통해서 가져올것
    Result result = await repository.deleteTbWhCmCodeAll();
    result.when(success: (value) async {
    }, error: (message) {
      Result.error(message);
    });

    List<TbWhCmCode> tbWhCmCodes = [];

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

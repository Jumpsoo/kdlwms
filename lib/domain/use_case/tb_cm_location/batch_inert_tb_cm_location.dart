import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';

class BatchInsertTbCmLocation {
  final TbCmLocationRepo repository;

  BatchInsertTbCmLocation(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(List<TbCmLocation> tbCmLocations) async {
    //삭제 후 등록
    Result result = await repository.deleteTbCmLocationAllBySetFlag('N');
    result.when(success: (value) async {
      //등록
      Result resultIns = await repository.upsertTbCmLocation(tbCmLocations);
      resultIns.when(
          success: (value) {},
          error: (message) {
            return Result.error(message);
          });
    }, error: (message) {
      return Result.error(message);
    });

    return const Result.success(true);
  }
}

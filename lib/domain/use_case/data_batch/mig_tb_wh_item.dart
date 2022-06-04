
// 배치명 : 품목정보 전체 덮어쓰기
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/repository/tb_wh_item_repo.dart';

class MigTbWhItem {
  final TbWhItemRepo repository;
  MigTbWhItem(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(List<TbWhItem> tbWhItems) async {

    Result result = await repository.deleteTbWhItemAll();
    result.when(success: (value) {
    }, error: (message) {
      Result.error(message);
    });

    for(TbWhItem item in tbWhItems) {
      result = await repository.insertTbWhItem(item);
      result.when(success: (value) {
      }, error: (message) {
        Result.error(message);
      });
    }
    return const Result.success(true);
  }
}

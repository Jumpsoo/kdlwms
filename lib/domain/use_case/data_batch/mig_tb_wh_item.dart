
// 배치명 : 품목정보 전체 덮어쓰기
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/repository/tb_wh_item_repo.dart';

class MigTbWhItem {
  final TbWhItemRepo repository;
  MigTbWhItem(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<bool> call(List<TbWhItem> tbWhItems) async {
    if(await repository.deleteTbWhItemAll() == false){
      return false;
    }
    for(TbWhItem item in tbWhItems){
      if(await repository.insertTbWhItem(item) == false){
        return false;
      }
    }
    return true;
  }
}

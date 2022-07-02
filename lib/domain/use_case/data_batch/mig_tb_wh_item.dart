// 배치명 : 품목정보 전체 덮어쓰기
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/repository/item_rcv_repo_impl.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/repository/tb_wh_item_repo.dart';

class MigTbWhItem {
  final TbWhItemRepo repository;
  final ItemRcvRepoImpl recvRepository;

  MigTbWhItem(this.repository, this.recvRepository);

  // 서버에서 값조회 -> 있으면 삭제 -> 등록
  // 서버에서 데이터를 조회해서 로컬디비에 저장한다.
  Future<Result<bool>> call(TbWhItem condTbWhItem) async {

    String errorMsg =  ' ';
    //서버에서 데이터를 조회한다.
    Result resultRecv = await recvRepository.selectItemList('');
    resultRecv.when(success: (itemList) async {
      if (itemList.isEmpty) {
        return const Result.error('복사할 대상이 없습니다.');
      }

      Result resultDelete = await repository.deleteAndInsertTbWhItemBatch(itemList);
      resultDelete.when(success: (value) async {



      }, error: (message) async{
        errorMsg = message;
        return  Result.error(message);
      });
    }, error: (message)  {
      errorMsg = message;
      return Result.error(message);
    });

    if(errorMsg.isNotEmpty){
      return const Result.success(true);
    }else{
      return const Result.error('예외 발생');
    }
  }
}

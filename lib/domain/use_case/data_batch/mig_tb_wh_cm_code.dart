import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/repository/cm_code_rcv_repo_impl.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';

// 배치명 : 공통코드 전체 덮어쓰기
class MigTbWhCmCode {
  late final CmCodeRcvRepoImpl cmCodeRcvRepoImpl;
  final TbWhCmCodeRepo repository;

  MigTbWhCmCode(this.repository, this.cmCodeRcvRepoImpl);

  //기존데이터 삭제 -> 재등록
  Future<Result<String>> call(TbWhCmCode tbWhCmCode, String sBatchName) async {

    String errorMsg =  ' ';

    if(cmCodeRcvRepoImpl == null) cmCodeRcvRepoImpl=CmCodeRcvRepoImpl();
    //서버에서 데이터를 조회한다.
    Result resultRecv = await cmCodeRcvRepoImpl.selectCmCodeListAll();

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
      return const Result.success('성공');
    }else{
      return const Result.error('예외 발생');
    }
  }
}

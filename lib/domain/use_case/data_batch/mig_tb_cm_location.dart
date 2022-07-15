// 배치명 : 공통코드 전체 덮어쓰기
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/repository/cm_code_rcv_repo_impl.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';

class MigTbCmLocation {
  final TbCmLocationRepo repository;
  final CmCodeRcvRepoImpl cmCodeRepository;

  MigTbCmLocation(this.repository, this.cmCodeRepository);

  // 값조회 ->데이터가 조회되면 기존데이터 삭제 후 -> 등록
  Future<Result<bool>> call() async {
    Result result;
    //설정된 공정을 제외하고 모두 삭제 후 저장
    // SET_FLAG = 'Y' 은 그대로 둘 것
    result = await repository.deleteTbCmLocationAllBySetFlag('N');
    result.when(success: (value) async {
      TbWhCmCode tbWhCmCode = TbWhCmCode(grpCd: 'WAREHOUSE');

      Result codeList =
          await cmCodeRepository.selectCmCodeListByGrpCd(tbWhCmCode);

      codeList.when(success: (codeRetList) async {
        // 서버에서 조회 -> 저장한다 (있으면 업데이트하고 없으면 등록)
        Result resultIns = await repository.upsertTbCmLocation(
            getConvertTbWhCmCodeToTbCmLocationList(codeRetList));

        resultIns.when(success: (valueList) {
          return Result.success(valueList);
        }, error: (message) {
          return Result.error(message);
        });
      }, error: (message) {
        return Result.error(message);
      });

      // // 공통코드 서비스 개발되면 아래코드로 바꿀것
      //  Result resultList = await cmCodeRepository.selectCmCodeList('WAREHOUSE');
      //  resultList.when(success: (insertList) async{
      //    Result resultIns = await repository.upsertTbCmLocation(insertList);
      //  }, error: (message){});
    }, error: (message) {
      return Result.error(message);
    });

    return const Result.success(true);
  }

// 03. 작업장 정보 리스트
  List<TbCmLocation> getConvertTbWhCmCodeToTbCmLocationList(
      List<TbWhCmCode> inList) {
    List<TbCmLocation> retList = [];
    for (TbWhCmCode item in inList) {
      retList.add(TbCmLocation(
        WORKSHOP: item.codeCd!,
        WORKSHOP_NM: item.codeKoNm,
        LOCATION: '1',
        SYNC_DATETIME: DateTime.now(),
        SET_FLAG: 'N',
        CMF_1: ' ',
        CMF_2: ' ',
        CMF_3: ' ',
        CMF_4: ' ',
        CMF_5: ' ',
      ));
    }
    return retList;
  }
}

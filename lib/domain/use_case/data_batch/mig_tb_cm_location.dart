// 배치명 : 공통코드 전체 덮어쓰기
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/repository/cm_code_rcv_repo_impl.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_cm_location_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

class MigTbCmLocation {
  final TbCmLocationRepo repository;
  final CmCodeRcvRepoImpl cmCodeRepository;

  MigTbCmLocation(this.repository, this.cmCodeRepository);

  // 값조회 ->데이터가 조회되면 기존데이터 삭제 후 -> 등록
  Future<Result<bool>> call() async {
    Result result;
    //설정된 공정을 제외하고 모두 삭제 후 저장
    result = await repository.deleteTbCmLocationAllBySetFlag('N');
    result.when(success: (value) async{

      Result resultIns = await repository.upsertTbCmLocation(getTbCmLocationSampleList());
      // 공통코드 서비스 개발되면 아래코드로 바꿀것
      // Result resultList = await cmCodeRepository.selectCmCodeList('WAREHOUSE');
      // resultList.when(success: (insertList) async{
      //   Result resultIns = await repository.upsertTbCmLocation(insertList);
      // }, error: (message){});
    }, error: (message){});

    Result resultTmp = await repository.selectTbCmLocationListAll();
    resultTmp.when(success: (list){
      print(list);
    }, error: (message){});


    return const Result.success(true);
  }


// 03. 작업장 정보 리스트
  List<TbCmLocation> getTbCmLocationSampleList() {
    List<TbCmLocation> retList = [];
    retList.add(TbCmLocation(WORKSHOP: 'WH001',
      WORKSHOP_NM: '울산창고',
      LOCATION: '1',
      SYNC_DATETIME: DateTime.now(),
      SET_FLAG: 'N',
      CMF_1: ' ',
      CMF_2: ' ',
      CMF_3: ' ',
      CMF_4: ' ',
      CMF_5: ' ',));
    retList.add(TbCmLocation(WORKSHOP: 'WH002',
      WORKSHOP_NM: '창원창고',
      LOCATION: '1',
      SYNC_DATETIME: DateTime.now(),
      SET_FLAG: 'N',
      CMF_1: ' ',
      CMF_2: ' ',
      CMF_3: ' ',
      CMF_4: ' ',
      CMF_5: ' ',));
    retList.add(TbCmLocation(WORKSHOP: 'WH003',
      WORKSHOP_NM: '마산창고',
      LOCATION: '1',
      SYNC_DATETIME: DateTime.now(),
      SET_FLAG: 'N',
      CMF_1: ' ',
      CMF_2: ' ',
      CMF_3: ' ',
      CMF_4: ' ',
      CMF_5: ' ',));
    retList.add(TbCmLocation(WORKSHOP: 'WH004',
      WORKSHOP_NM: '화성창고',
      LOCATION: '1',
      SYNC_DATETIME: DateTime.now(),
      SET_FLAG: 'N',
      CMF_1: ' ',
      CMF_2: ' ',
      CMF_3: ' ',
      CMF_4: ' ',
      CMF_5: ' ',));
    retList.add(TbCmLocation(WORKSHOP: 'WH005',
      WORKSHOP_NM: '울산창고2',
      LOCATION: '1',
      SYNC_DATETIME: DateTime.now(),
      SET_FLAG: 'N',
      CMF_1: ' ',
      CMF_2: ' ',
      CMF_3: ' ',
      CMF_4: ' ',
      CMF_5: ' ',));
    retList.add(TbCmLocation(WORKSHOP: 'WH006',
      WORKSHOP_NM: '마산창고2',
      LOCATION: '1',
      SYNC_DATETIME: DateTime.now(),
      SET_FLAG: 'N',
      CMF_1: ' ',
      CMF_2: ' ',
      CMF_3: ' ',
      CMF_4: ' ',
      CMF_5: ' ',));
    retList.add(TbCmLocation(WORKSHOP: 'WH007',
      WORKSHOP_NM: '마산창고3',
      LOCATION: '1',
      SYNC_DATETIME: DateTime.now(),
      SET_FLAG: 'N',
      CMF_1: ' ',
      CMF_2: ' ',
      CMF_3: ' ',
      CMF_4: ' ',
      CMF_5: ' ',));
    retList.add(TbCmLocation(WORKSHOP: 'WH008',
      WORKSHOP_NM: '마산창고4',
      LOCATION: '1',
      SYNC_DATETIME: DateTime.now(),
      SET_FLAG: 'N',
      CMF_1: ' ',
      CMF_2: ' ',
      CMF_3: ' ',
      CMF_4: ' ',
      CMF_5: ' ',));

    return retList;
  }
}




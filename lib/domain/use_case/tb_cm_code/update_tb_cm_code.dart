import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';


class UpdateTbWhCmCode{
  final TbWhCmCodeRepo repository;

  UpdateTbWhCmCode(this.repository);

  Future<Result<bool?>> call (TbWhCmCode tbWhCmCode) async {
    return await repository.updateTbWhCmCode(tbWhCmCode);
  }
}

class UpdateLocalVersion{
  final TbWhCmCodeRepo repository;

  UpdateLocalVersion(this.repository);

  Future<Result<bool?>> call (String sVersion) async {
    //조회후 버전정보 수정 후 업데이트

    TbWhCmCode condItem = TbWhCmCode(grpCd: 'PDA_VERSION');
    Result result = await repository.selectTbWhCmCodeListByGrpCd(condItem);
    result.when(success: (updatingList) async{

      for(TbWhCmCode item in updatingList){
        item = item.copyWith(codeCd: sVersion);
        Result resultUpd = await repository.updateTbWhCmCode(item);
        resultUpd.when(success: (value){
          return const Result.success(true);
        }, error: (message){
          return Result.error(message);
        });
      }
    }, error: (message){
      return Result.error(message);
    });

    return const Result.success(true);
  }
}
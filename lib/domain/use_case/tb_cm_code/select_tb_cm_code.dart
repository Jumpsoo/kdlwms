import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class GetTbWhCmCodeList {
  final TbWhCmCodeRepo repository;

  GetTbWhCmCodeList(this.repository);

  Future<Result<List<TbWhCmCode>?>> call() async {
    return await repository.getTbWhCmCodeList();
  }
}

class GetCurrentLocalVersion {
  final TbWhCmCodeRepo repository;

  GetCurrentLocalVersion(this.repository);

  Future<String> call(String _grpCd) async {
    String version = '';
    TbWhCmCode tbWhCmCode = TbWhCmCode(grpCd: _grpCd, comps: gComps);
    Result result = await repository.selectTbWhCmCodeListByGrpCd(tbWhCmCode);
    result.when(success: (value){
      TbWhCmCode code = value[0];
      version = code.codeCd!;
    }, error: (message){
      return Result.error(message);
    });
    return version;
  }
}

class SelectTbWhCmCodeListByGrpCd {
  final TbWhCmCodeRepo repository;

  SelectTbWhCmCodeListByGrpCd(this.repository);

  Future<Result<List<TbWhCmCode>?>> call(String _grpCd) async {
    TbWhCmCode tbWhCmCode = TbWhCmCode(grpCd: _grpCd, comps: gComps);

    return await repository.selectTbWhCmCodeListByGrpCd(tbWhCmCode);
  }
}

class SelectTbWhCmCodeListByCodeCd {
  final TbWhCmCodeRepo repository;

  SelectTbWhCmCodeListByCodeCd(this.repository);

  Future<Result<List<TbWhCmCode>?>> call(TbWhCmCode tbWhCmCode) async {
    return await repository.selectTbWhCmCodeListByCodeCd(tbWhCmCode);
  }
}


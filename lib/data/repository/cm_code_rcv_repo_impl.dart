import 'package:kdlwms/data/data_source/cm_code_rcv_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/cm_code_rcv_repo.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class CmCodeRcvRepoImpl implements CmCodeRcvRepo {
  CmCodeRcvApi api = CmCodeRcvApi();

  @override
  Future<Result<List<TbWhCmCode>>> selectCmCodeListAll() async {
    final Result<Iterable> result = await api.selectCmCodeListAll();

    return result.when(success: (iterable) {
      return Result.success(
          iterable.map((e) => TbWhCmCode.fromJson(e)).toList());
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<List<TbWhCmCode>>> selectCmCodeListByCodeCd(TbWhCmCode tbWhCmCode) async {
    final Result<Iterable> result = await api.selectCmCodeListByCodeCd(tbWhCmCode);

    return result.when(success: (iterable) {
      return Result.success(
          iterable.map((e) => TbWhCmCode.fromJson(e)).toList());
    }, error: (message) {
      return Result.error(message);
    });
  }
  @override
  Future<Result<List<TbWhCmCode>>> selectCmCodeListByGrpCd(TbWhCmCode tbWhCmCode) async {
    final Result<Iterable> result = await api.selectCmCodeListByGrpCd(tbWhCmCode);

    return result.when(success: (iterable) {
      return Result.success(
          iterable.map((e) => TbWhCmCode.fromJson(e)).toList());
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<String>> getPDAVersion() async {
    String pdaVersion = '동기화 실패';
    final Result<Iterable> result = await api.getPDAVersion();

    result.when(success: (iterable) {
      List<TbWhCmCode> items = iterable.map((e) => TbWhCmCode.fromJson(e)).toList();
      if(items.isNotEmpty){
        pdaVersion = items[0].codeCd!;
      }
    }, error: (message) {
      return Result.error(message);
    });

    return Result.success(pdaVersion);
  }
}

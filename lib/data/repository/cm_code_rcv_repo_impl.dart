import 'package:kdlwms/data/data_source/cm_code_rcv_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/cm_code_rcv_repo.dart';

class CmCodeRcvRepoImpl implements CmCodeRcvRepo {
  CmCodeRcvApi api = CmCodeRcvApi();

  @override
  Future<Result<List<TbWhCmCode>>> selectCmCodeList(String query) async {
    final Result<Iterable> result = await api.selectCmCodeList(query);

    return result.when(success: (iterable) {
      return Result.success(
          iterable.map((e) => TbWhCmCode.fromJson(e)).toList());
    }, error: (message) {
      return Result.error(message);
    });
  }
}

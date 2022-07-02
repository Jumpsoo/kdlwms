import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_server_info.dart';
import 'package:kdlwms/domain/repository/tb_server_info_repo.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class SelectTbServerInfo {

  final TbServerInfoRepo repository;

  SelectTbServerInfo(this.repository);

  Future<String> call() async {
    String sUrl = '';
    Result result = await repository.selectTbServerInfo();
    result.when(success: (value) {
      TbServerInfo info = value;
      sUrl = info.serverUrl;
    }, error: (message) {
      sUrl = '';
    });
    return sUrl;
  }
}

//장치명 기타정보가져오기 가져오기
class SelectPropertyInfo {
  final TbServerInfoRepo repository;

  SelectPropertyInfo(this.repository);

  Future<Result<TbServerInfo>> call() async {
    String sDeviceWCId = '';
    Result result = await repository.selectTbServerInfo();
    result.when(success: (value) {
      return Result.success(value);
    }, error: (message) {
      return Result.error(message);
    });
    return Result.error(gErrorMsg);

  }
}
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_server_info.dart';
import 'package:kdlwms/domain/repository/tb_server_info_repo.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class SelectTbServerInfoUseCase {
  final TbServerInfoRepo repository;

  SelectTbServerInfoUseCase(this.repository);

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
class SelectPropertyInfoUseCase {
  final TbServerInfoRepo repository;

  SelectPropertyInfoUseCase(this.repository);

  Future<Result<TbServerInfo>> call() async {
    bool bRet = false;
    String sMsg = '';
    late TbServerInfo tbServerInfo;

    Result result = await repository.selectTbServerInfo();
    result.when(success: (value) {

      bRet = true;
      tbServerInfo = value;

      return Result.success(value);
    }, error: (message) {
      bRet = false;
      sMsg = message;
    });

    if(bRet){
      return Result.success(tbServerInfo);
    }else{
      return Result.error(sMsg);
    }
  }
}

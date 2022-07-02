import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_server_info.dart';
import 'package:kdlwms/domain/repository/tb_server_info_repo.dart';


class MergeTbServerInfo {

  final TbServerInfoRepo repository;
  MergeTbServerInfo(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(String sUrl, String sDeviceId, int nVibrateEnable) async {
    TbServerInfo tbServerInfo = TbServerInfo(serverUrl: sUrl, deviceId: sDeviceId, vibrateState: nVibrateEnable);
    return await repository.mergeTbServerInfo(tbServerInfo);
  }
}

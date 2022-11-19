import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_server_info.dart';
import 'package:kdlwms/domain/repository/tb_server_info_repo.dart';


class MergeTbServerInfoUseCase {

  final TbServerInfoRepo repository;
  MergeTbServerInfoUseCase(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(String sUrl, String sDeviceId, String sComps, int nVibrateEnable, int nScanAlwaysOn) async {
    TbServerInfo tbServerInfo = TbServerInfo(serverUrl: sUrl, deviceId: sDeviceId, comps: sComps, vibrateState: nVibrateEnable, scanAlwaysState: nScanAlwaysOn);

    print(" >> MergeTbServerInfoUseCase ");

    return await repository.mergeTbServerInfo(tbServerInfo);
  }
}

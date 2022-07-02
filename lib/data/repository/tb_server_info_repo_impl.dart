import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/data_source/tb_server_info_db_helper.dart';
import 'package:kdlwms/domain/model/tb_server_info.dart';
import 'package:kdlwms/domain/repository/tb_server_info_repo.dart';

class TbServerInfoRepoImpl implements TbServerInfoRepo {
  final TbServerInfoDbHelper db;

  TbServerInfoRepoImpl(this.db);

  @override
  //서버 url 조회
  Future<Result<TbServerInfo?>> selectTbServerInfo()  async {
    return await db.selectTbServerInfo();
  }

  @override
  //서버설정 변경 시 업데이트
  Future<Result<bool>> mergeTbServerInfo(TbServerInfo tbServerInfo) async {
    return await db.mergeTbServerInfo(tbServerInfo);
  }

}


import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_server_info.dart';

abstract class TbServerInfoRepo{

  Future<Result<TbServerInfo?>> selectTbServerInfo();

  Future<Result<bool>> mergeTbServerInfo(TbServerInfo tbServerInfo);
}
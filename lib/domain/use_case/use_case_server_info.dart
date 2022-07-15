import 'package:kdlwms/domain/use_case/tb_server_info/select_tb_server_info.dart';
import 'package:kdlwms/domain/use_case/tb_server_info/update_tb_server_info.dart';

class UseCaseServerInfo {
  final SelectTbServerInfo selectTbServerInfo;
  final SelectPropertyInfo selectPropertyInfo;
  final MergeTbServerInfo mergeTbServerInfo;

  UseCaseServerInfo({
    required this.selectTbServerInfo,
    required this.selectPropertyInfo,
    required this.mergeTbServerInfo,
  });
}

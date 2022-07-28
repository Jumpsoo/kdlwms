import 'package:kdlwms/domain/use_case/tb_server_info/select_tb_server_info.dart';
import 'package:kdlwms/domain/use_case/tb_server_info/update_tb_server_info.dart';

class UseCaseServerInfo {
  final SelectTbServerInfoUseCase selectTbServerInfoUseCase;
  final SelectPropertyInfoUseCase selectPropertyInfoUseCase;
  final MergeTbServerInfoUseCase mergeTbServerInfoUseCase;

  UseCaseServerInfo({
    required this.selectTbServerInfoUseCase,
    required this.selectPropertyInfoUseCase,
    required this.mergeTbServerInfoUseCase,
  });
}

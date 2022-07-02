import 'package:kdlwms/domain/use_case/data_batch/mig_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_wh_cm_code.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_cm_sync.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_wh_item.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/update_tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_sync/save_tb_cm_sync_info.dart';
import 'package:kdlwms/domain/use_case/tb_cm_sync/select_tb_cm_sync.dart';
import 'package:kdlwms/domain/use_case/tb_server_info/select_tb_server_info.dart';
import 'package:kdlwms/domain/use_case/tb_server_info/update_tb_server_info.dart';
import 'package:kdlwms/domain/use_case/web_api/get_common_info.dart';

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

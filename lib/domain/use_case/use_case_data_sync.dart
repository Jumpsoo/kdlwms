import 'package:kdlwms/domain/use_case/data_batch/mig_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_wh_cm_code.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_cm_sync.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_wh_item.dart';
import 'package:kdlwms/domain/use_case/tb_cm_code/update_tb_cm_code.dart';
import 'package:kdlwms/domain/use_case/tb_cm_sync/save_tb_cm_sync_info.dart';
import 'package:kdlwms/domain/use_case/tb_cm_sync/select_tb_cm_sync.dart';
import 'package:kdlwms/domain/use_case/web_api/get_common_info.dart';

class UseCaseDataSync {
  final MigTbWhCmCode migTbWhCmCode;
  final MigTbCmSync migTbCmSync;
  final MigTbWhItem migTbWhItem;
  final MigTbCmLocation migTbCmLocation;

  // final GetCurrentVersionRow getCurrentVersionRow;
  final GetServerVersion getServerVersion;

  final UpdateLocalVersion updateLocalVersion;
  final SaveLastSyncInfo saveLastSyncInfo;
  final GetLastSyncInfo getLastSyncInfo;

  UseCaseDataSync({
    required this.migTbWhCmCode,
    required this.migTbWhItem,
    required this.migTbCmLocation,
    required this.migTbCmSync,
    // required this.getCurrentVersionRow,
    required this.getServerVersion,
    required this.updateLocalVersion,
    required this.saveLastSyncInfo,
    required this.getLastSyncInfo,
  });
}

import 'package:kdlwms/domain/use_case/data_batch/mig_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_wh_cm_code.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_cm_sync.dart';
import 'package:kdlwms/domain/use_case/data_batch/mig_tb_wh_item.dart';

class UseCaseDataBatch {
  final MigTbWhCmCode migTbWhCmCode;
  final MigTbCmSync migTbCmSync;
  final MigTbWhItem migTbWhItem;
  final MigTbCmLocation migTbCmLocation;

  UseCaseDataBatch({
    required this.migTbWhCmCode,
    required this.migTbWhItem,
    required this.migTbCmLocation,
    required this.migTbCmSync,
  });
}

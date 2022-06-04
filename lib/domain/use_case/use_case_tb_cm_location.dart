import 'package:kdlwms/domain/use_case/tb_cm_location/add_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/batch_inert_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/delete_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/select_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/update_tb_cm_location.dart';

class UseCaseTbCmLocation {
  final AddTbCmLocation  addTbCmLocation;
  final UpdateTbCmLocation updateTbCmLocation;
  final UpdateFromSelectTbCmLocationToEnable updateFromSelectTbCmLocationToEnable;
  final UpdateFromSelectTbCmLocationToDisableAll updateFromSelectTbCmLocationToDisableAll;

  final DeleteTbCmLocation deleteTbCmLocation;
  final SelectTbCmLocationAll selectTbCmLocationAll;
  final SelectTbCmLocationCurrentItem selectTbCmLocationCurrentItem;
  final SelectTbCmLocation selectTbCmLocation;
  final BatchInsertTbCmLocation batchInsertTbCmLocation;

  UseCaseTbCmLocation({
    required this.addTbCmLocation,
    required this.updateTbCmLocation,
    required this.updateFromSelectTbCmLocationToEnable,
    required this.updateFromSelectTbCmLocationToDisableAll,
    required this.deleteTbCmLocation,
    required this.selectTbCmLocation,
    required this.selectTbCmLocationAll,
    required this.selectTbCmLocationCurrentItem,
    required this.batchInsertTbCmLocation,
  });
}

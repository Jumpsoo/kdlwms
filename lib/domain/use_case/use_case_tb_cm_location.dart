import 'package:kdlwms/domain/use_case/tb_cm_location/add_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/batch_inert_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/delete_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/select_tb_cm_location.dart';
import 'package:kdlwms/domain/use_case/tb_cm_location/update_tb_cm_location.dart';

class UseCaseTbCmLocation {
  final AddTbCmLocation  addTbCmLocation;
  final UpdateTbCmLocation updateTbCmLocation;
  final DeleteTbCmLocation deleteTbCmLocation;
  final SelectTbCmLocationAll selectTbCmLocationAll;
  final SelectTbCmLocation selectTbCmLocation;
  final BatchInsertTbCmLocation batchInsertTbCmLocation;

  UseCaseTbCmLocation({
    required this.addTbCmLocation,
    required this.updateTbCmLocation,
    required this.deleteTbCmLocation,
    required this.selectTbCmLocation,
    required this.selectTbCmLocationAll,
    required this.batchInsertTbCmLocation,
  });
}

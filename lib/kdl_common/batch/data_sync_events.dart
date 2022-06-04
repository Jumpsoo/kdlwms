import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_sync_events.freezed.dart';

@freezed
abstract class DataSyncEvent with _$DataSyncEvent {

  const factory DataSyncEvent.migTbWhCmCode(List<TbWhCmCode> tbWhCmCodes, String sBatchName) = MigTbWhCmCode;
  const factory DataSyncEvent.migTbWhItem(List<TbWhItem> tbWhItems) = MigTbWhItem;
  const factory DataSyncEvent.migTbCmLocation(List<TbCmLocation> tbCmLocations) = MigTbCmLocation;
  const factory DataSyncEvent.migTbCmSync(List<TbCmSync> tbCmSyncs) = MigTbCmSync;

}

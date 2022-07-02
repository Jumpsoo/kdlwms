import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kdlwms/domain/model/tb_server_info.dart';

part 'setting_workshop_events.freezed.dart';

@freezed
abstract class SettingInfoEvents with _$SettingInfoEvents {

  const factory SettingInfoEvents.selectTbCmLocationAll() = SelectTbCmLocationAll;
  const factory SettingInfoEvents.selectTbCmLocationCurrentItem() = SelectTbCmLocationCurrentItem;
  const factory SettingInfoEvents.selectTbCmLocation(TbCmLocation tbCmLocation) = SelectTbCmLocation;

  const factory SettingInfoEvents.updateTbCmLocation(TbCmLocation tbCmLocation) = UpdateTbCmLocation;
  const factory SettingInfoEvents.updateFromSelectTbCmLocationToEnable(String sWorkShop) = UpdateFromSelectTbCmLocationToEnable;
  const factory SettingInfoEvents.updateFromSelectTbCmLocationToDisableAll() = UpdateFromSelectTbCmLocationToDisableAll;

  const factory SettingInfoEvents.insertTbCmLocation(TbCmLocation tbCmLocation) = InsertTbCmLocation;
  const factory SettingInfoEvents.batchInsertTbCmLocation(List<TbCmLocation> tbCmLocations) = BatchInsertTbCmLocation;

  // //서버 URL
  // const factory SettingInfoEvents.selectTbServerInfo(TbServerInfo tbServerInfo) = SelectTbServerInfo;
  // const factory SettingInfoEvents.mergeTbServerInfo(TbServerInfo tbServerInfo) = MergeTbServerInfo;

}

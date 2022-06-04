import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_workshop_events.freezed.dart';

@freezed
abstract class SettingWorkShopEvents with _$SettingWorkShopEvents {

  const factory SettingWorkShopEvents.selectTbCmLocationAll() = SelectTbCmLocationAll;
  const factory SettingWorkShopEvents.selectTbCmLocationCurrentItem() = SelectTbCmLocationCurrentItem;
  const factory SettingWorkShopEvents.selectTbCmLocation(TbCmLocation tbCmLocation) = SelectTbCmLocation;

  const factory SettingWorkShopEvents.updateTbCmLocation(TbCmLocation tbCmLocation) = UpdateTbCmLocation;
  const factory SettingWorkShopEvents.updateFromSelectTbCmLocationToEnable(String sWorkShop) = UpdateFromSelectTbCmLocationToEnable;
  const factory SettingWorkShopEvents.updateFromSelectTbCmLocationToDisableAll() = UpdateFromSelectTbCmLocationToDisableAll;

  const factory SettingWorkShopEvents.insertTbCmLocation(TbCmLocation tbCmLocation) = InsertTbCmLocation;
  const factory SettingWorkShopEvents.batchInsertTbCmLocation(List<TbCmLocation> tbCmLocations) = BatchInsertTbCmLocation;
}

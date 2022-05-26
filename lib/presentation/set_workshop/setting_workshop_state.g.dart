// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_workshop_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingWorkshopState _$$_SettingWorkshopStateFromJson(
        Map<String, dynamic> json) =>
    _$_SettingWorkshopState(
      tbCmLocations: (json['tbCmLocations'] as List<dynamic>?)
          ?.map((e) => TbCmLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLoading: json['isLoading'] as bool,
    );

Map<String, dynamic> _$$_SettingWorkshopStateToJson(
        _$_SettingWorkshopState instance) =>
    <String, dynamic>{
      'tbCmLocations': instance.tbCmLocations,
      'isLoading': instance.isLoading,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_server_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TbServerInfo _$$_TbServerInfoFromJson(Map<String, dynamic> json) =>
    _$_TbServerInfo(
      serverUrl: json['serverUrl'] as String,
      comps: json['comps'] as String?,
      deviceId: json['deviceId'] as String?,
      vibrateState: json['vibrateState'] as int?,
      scanAlwaysState: json['scanAlwaysState'] as int?,
    );

Map<String, dynamic> _$$_TbServerInfoToJson(_$_TbServerInfo instance) =>
    <String, dynamic>{
      'serverUrl': instance.serverUrl,
      'comps': instance.comps,
      'deviceId': instance.deviceId,
      'vibrateState': instance.vibrateState,
      'scanAlwaysState': instance.scanAlwaysState,
    };

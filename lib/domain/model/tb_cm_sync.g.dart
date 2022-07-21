// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_cm_sync.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TbCmSync _$$_TbCmSyncFromJson(Map<String, dynamic> json) => _$_TbCmSync(
      versionCode: json['versionCode'] as String,
      versionDesc: json['versionDesc'] as String?,
      syncDateTime: json['syncDateTime'] == null
          ? null
          : DateTime.parse(json['syncDateTime'] as String),
      cmf1: json['cmf1'] as String?,
      cmf2: json['cmf2'] as String?,
      cmf3: json['cmf3'] as String?,
      cmf4: json['cmf4'] as String?,
      cmf5: json['cmf5'] as String?,
    );

Map<String, dynamic> _$$_TbCmSyncToJson(_$_TbCmSync instance) =>
    <String, dynamic>{
      'versionCode': instance.versionCode,
      'versionDesc': instance.versionDesc,
      'syncDateTime': instance.syncDateTime?.toIso8601String(),
      'cmf1': instance.cmf1,
      'cmf2': instance.cmf2,
      'cmf3': instance.cmf3,
      'cmf4': instance.cmf4,
      'cmf5': instance.cmf5,
    };

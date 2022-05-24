// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_cm_sync.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TbCmSync _$$_TbCmSyncFromJson(Map<String, dynamic> json) => _$_TbCmSync(
      VERSION_CODE: json['VERSION_CODE'] as String?,
      VERSION_DESC: json['VERSION_DESC'] as String?,
      SYNC_DATETIME: json['SYNC_DATETIME'] == null
          ? null
          : DateTime.parse(json['SYNC_DATETIME'] as String),
      CMF_1: json['CMF_1'] as String?,
      CMF_2: json['CMF_2'] as String?,
      CMF_3: json['CMF_3'] as String?,
      CMF_4: json['CMF_4'] as String?,
      CMF_5: json['CMF_5'] as String?,
    );

Map<String, dynamic> _$$_TbCmSyncToJson(_$_TbCmSync instance) =>
    <String, dynamic>{
      'VERSION_CODE': instance.VERSION_CODE,
      'VERSION_DESC': instance.VERSION_DESC,
      'SYNC_DATETIME': instance.SYNC_DATETIME?.toIso8601String(),
      'CMF_1': instance.CMF_1,
      'CMF_2': instance.CMF_2,
      'CMF_3': instance.CMF_3,
      'CMF_4': instance.CMF_4,
      'CMF_5': instance.CMF_5,
    };

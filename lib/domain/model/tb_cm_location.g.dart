// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_cm_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TbCmLocation _$$_TbCmLocationFromJson(Map<String, dynamic> json) =>
    _$_TbCmLocation(
      WORKSHOP: json['WORKSHOP'] as String?,
      WORKSHOP_NM: json['WORKSHOP_NM'] as String?,
      LOCATION: json['LOCATION'] as String?,
      SYNC_DATETIME: json['SYNC_DATETIME'] == null
          ? null
          : DateTime.parse(json['SYNC_DATETIME'] as String),
      CMF_1: json['CMF_1'] as String?,
      CMF_2: json['CMF_2'] as String?,
      CMF_3: json['CMF_3'] as String?,
      CMF_4: json['CMF_4'] as String?,
      CMF_5: json['CMF_5'] as String?,
    );

Map<String, dynamic> _$$_TbCmLocationToJson(_$_TbCmLocation instance) =>
    <String, dynamic>{
      'WORKSHOP': instance.WORKSHOP,
      'WORKSHOP_NM': instance.WORKSHOP_NM,
      'LOCATION': instance.LOCATION,
      'SYNC_DATETIME': instance.SYNC_DATETIME?.toIso8601String(),
      'CMF_1': instance.CMF_1,
      'CMF_2': instance.CMF_2,
      'CMF_3': instance.CMF_3,
      'CMF_4': instance.CMF_4,
      'CMF_5': instance.CMF_5,
    };

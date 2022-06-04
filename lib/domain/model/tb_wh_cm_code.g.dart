// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_wh_cm_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TbWhCmCode _$$_TbWhCmCodeFromJson(Map<String, dynamic> json) =>
    _$_TbWhCmCode(
      CODE_ID: json['CODE_ID'] as int,
      GRP_CD: json['GRP_CD'] as String,
      CODE_CD: json['CODE_CD'] as String?,
      CODE_KO_NM: json['CODE_KO_NM'] as String?,
      CODE_EN_NM: json['CODE_EN_NM'] as String?,
      CODE_JA_NM: json['CODE_JA_NM'] as String?,
      REF_1: json['REF_1'] as String?,
      REF_2: json['REF_2'] as String?,
      REF_3: json['REF_3'] as String?,
      REF_4: json['REF_4'] as String?,
      REF_5: json['REF_5'] as String?,
      CODE_ORDR: json['CODE_ORDR'] as int?,
      USE_YN: json['USE_YN'] as String?,
      RGSTR_ID: json['RGSTR_ID'] as int?,
      RGST_DT: json['RGST_DT'] == null
          ? null
          : DateTime.parse(json['RGST_DT'] as String),
      UPDTR_ID: json['UPDTR_ID'] as int?,
      UPDT_DT: json['UPDT_DT'] == null
          ? null
          : DateTime.parse(json['UPDT_DT'] as String),
    );

Map<String, dynamic> _$$_TbWhCmCodeToJson(_$_TbWhCmCode instance) =>
    <String, dynamic>{
      'CODE_ID': instance.CODE_ID,
      'GRP_CD': instance.GRP_CD,
      'CODE_CD': instance.CODE_CD,
      'CODE_KO_NM': instance.CODE_KO_NM,
      'CODE_EN_NM': instance.CODE_EN_NM,
      'CODE_JA_NM': instance.CODE_JA_NM,
      'REF_1': instance.REF_1,
      'REF_2': instance.REF_2,
      'REF_3': instance.REF_3,
      'REF_4': instance.REF_4,
      'REF_5': instance.REF_5,
      'CODE_ORDR': instance.CODE_ORDR,
      'USE_YN': instance.USE_YN,
      'RGSTR_ID': instance.RGSTR_ID,
      'RGST_DT': instance.RGST_DT?.toIso8601String(),
      'UPDTR_ID': instance.UPDTR_ID,
      'UPDT_DT': instance.UPDT_DT?.toIso8601String(),
    };

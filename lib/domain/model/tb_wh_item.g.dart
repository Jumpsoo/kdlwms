// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_wh_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TbWhItem _$$_TbWhItemFromJson(Map<String, dynamic> json) => _$_TbWhItem(
      ITEM_NM: json['ITEM_NM'] as String?,
      STANDARD: json['STANDARD'] as String?,
      QT: json['QT'] as String?,
      ITEM_NO: json['ITEM_NO'] as String?,
      BOX_KG: json['BOX_KG'] as int?,
      LENGTH: json['LENGTH'] as int?,
      WIDTH: json['WIDTH'] as int?,
      HEIGHT: json['HEIGHT'] as int?,
      WAREHOUSE_CD: json['WAREHOUSE_CD'] as String?,
      WAREHOUSE_NM: json['WAREHOUSE_NM'] as String?,
      WAREHOUSE_AREA: json['WAREHOUSE_AREA'] as String?,
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

Map<String, dynamic> _$$_TbWhItemToJson(_$_TbWhItem instance) =>
    <String, dynamic>{
      'ITEM_NM': instance.ITEM_NM,
      'STANDARD': instance.STANDARD,
      'QT': instance.QT,
      'ITEM_NO': instance.ITEM_NO,
      'BOX_KG': instance.BOX_KG,
      'LENGTH': instance.LENGTH,
      'WIDTH': instance.WIDTH,
      'HEIGHT': instance.HEIGHT,
      'WAREHOUSE_CD': instance.WAREHOUSE_CD,
      'WAREHOUSE_NM': instance.WAREHOUSE_NM,
      'WAREHOUSE_AREA': instance.WAREHOUSE_AREA,
      'USE_YN': instance.USE_YN,
      'RGSTR_ID': instance.RGSTR_ID,
      'RGST_DT': instance.RGST_DT?.toIso8601String(),
      'UPDTR_ID': instance.UPDTR_ID,
      'UPDT_DT': instance.UPDT_DT?.toIso8601String(),
    };

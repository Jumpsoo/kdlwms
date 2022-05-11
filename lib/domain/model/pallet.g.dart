// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pallet _$$_PalletFromJson(Map<String, dynamic> json) => _$_Pallet(
      PALLET_SEQ: json['PALLET_SEQ'] as int,
      WORKSHOP: json['WORKSHOP'] as String,
      LOCATION: json['LOCATION'] as String,
      ITEM_NO: json['ITEM_NO'] as String,
      ITEM_LOT: json['ITEM_LOT'] as String,
      QUANTITY: json['QUANTITY'] as int,
      STATE: json['STATE'] as int,
      BARCODE: json['BARCODE'] as String,
      SCAN_DATE: DateTime.parse(json['SCAN_DATE'] as String),
      SCAN_USERNM: json['SCAN_USERNM'] as String,
      BOX_NO: json['BOX_NO'] as int,
      PRINT_FLAG: json['PRINT_FLAG'] as String?,
      PRINT_DATE: json['PRINT_DATE'] == null
          ? null
          : DateTime.parse(json['PRINT_DATE'] as String),
      PRINT_USER: json['PRINT_USER'] as String?,
      AS400IF_FLAG: json['AS400IF_FLAG'] as String?,
      AS400IF_DATE: json['AS400IF_DATE'] == null
          ? null
          : DateTime.parse(json['AS400IF_DATE'] as String),
      AS400IF_USER: json['AS400IF_USER'] as String?,
      RGSTR_ID: json['RGSTR_ID'] as int?,
      RGST_DT: json['RGST_DT'] == null
          ? null
          : DateTime.parse(json['RGST_DT'] as String),
      UPDTR_ID: json['UPDTR_ID'] as int?,
      UPDT_DT: json['UPDT_DT'] == null
          ? null
          : DateTime.parse(json['UPDT_DT'] as String),
    );

Map<String, dynamic> _$$_PalletToJson(_$_Pallet instance) => <String, dynamic>{
      'PALLET_SEQ': instance.PALLET_SEQ,
      'WORKSHOP': instance.WORKSHOP,
      'LOCATION': instance.LOCATION,
      'ITEM_NO': instance.ITEM_NO,
      'ITEM_LOT': instance.ITEM_LOT,
      'QUANTITY': instance.QUANTITY,
      'STATE': instance.STATE,
      'BARCODE': instance.BARCODE,
      'SCAN_DATE': instance.SCAN_DATE.toIso8601String(),
      'SCAN_USERNM': instance.SCAN_USERNM,
      'BOX_NO': instance.BOX_NO,
      'PRINT_FLAG': instance.PRINT_FLAG,
      'PRINT_DATE': instance.PRINT_DATE?.toIso8601String(),
      'PRINT_USER': instance.PRINT_USER,
      'AS400IF_FLAG': instance.AS400IF_FLAG,
      'AS400IF_DATE': instance.AS400IF_DATE?.toIso8601String(),
      'AS400IF_USER': instance.AS400IF_USER,
      'RGSTR_ID': instance.RGSTR_ID,
      'RGST_DT': instance.RGST_DT?.toIso8601String(),
      'UPDTR_ID': instance.UPDTR_ID,
      'UPDT_DT': instance.UPDT_DT?.toIso8601String(),
    };

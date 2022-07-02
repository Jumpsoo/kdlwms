// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_wh_pallet_load.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TbWhPalletLoad _$$_TbWhPalletLoadFromJson(Map<String, dynamic> json) =>
    _$_TbWhPalletLoad(
      comps: json['comps'] as String?,
      palletSeq: json['palletSeq'] as int?,
      workshop: json['workshop'] as String?,
      location: json['location'] as String?,
      itemNo: json['itemNo'] as String?,
      itemLot: json['itemLot'] as String?,
      quantity: json['quantity'] as int?,
      state: json['state'] as String?,
      barcode: json['barcode'] as String?,
      scanDate: json['scanDate'] == null
          ? null
          : DateTime.parse(json['scanDate'] as String),
      scanUsernm: json['scanUsernm'] as String?,
      boxNo: json['boxNo'] as int?,
      printFlag: json['printFlag'] as String?,
      printDate: json['printDate'] == null
          ? null
          : DateTime.parse(json['printDate'] as String),
      printUser: json['printUser'] as String?,
      as400IfFlag: json['as400IfFlag'] as String?,
      as400IfDate: json['as400IfDate'] == null
          ? null
          : DateTime.parse(json['as400IfDate'] as String),
      as400IfUser: json['as400IfUser'] as String?,
      rgstrId: json['rgstrId'] as int?,
      rgstDt: json['rgstDt'] == null
          ? null
          : DateTime.parse(json['rgstDt'] as String),
      updtrId: json['updtrId'] as int?,
      updtDt: json['updtDt'] == null
          ? null
          : DateTime.parse(json['updtDt'] as String),
    );

Map<String, dynamic> _$$_TbWhPalletLoadToJson(_$_TbWhPalletLoad instance) =>
    <String, dynamic>{
      'comps': instance.comps,
      'palletSeq': instance.palletSeq,
      'workshop': instance.workshop,
      'location': instance.location,
      'itemNo': instance.itemNo,
      'itemLot': instance.itemLot,
      'quantity': instance.quantity,
      'state': instance.state,
      'barcode': instance.barcode,
      'scanDate': instance.scanDate?.toIso8601String(),
      'scanUsernm': instance.scanUsernm,
      'boxNo': instance.boxNo,
      'printFlag': instance.printFlag,
      'printDate': instance.printDate?.toIso8601String(),
      'printUser': instance.printUser,
      'as400IfFlag': instance.as400IfFlag,
      'as400IfDate': instance.as400IfDate?.toIso8601String(),
      'as400IfUser': instance.as400IfUser,
      'rgstrId': instance.rgstrId,
      'rgstDt': instance.rgstDt?.toIso8601String(),
      'updtrId': instance.updtrId,
      'updtDt': instance.updtDt?.toIso8601String(),
    };

_$_TbWhPalletLoadGroup _$$_TbWhPalletLoadGroupFromJson(
        Map<String, dynamic> json) =>
    _$_TbWhPalletLoadGroup(
      comps: json['comps'] as String?,
      palletSeq: json['palletSeq'] as int?,
      itemNo: json['itemNo'] as String?,
      itemLot: json['itemLot'] as String?,
      quantity: json['quantity'] as int?,
      boxCnt: json['boxCnt'] as int?,
    );

Map<String, dynamic> _$$_TbWhPalletLoadGroupToJson(
        _$_TbWhPalletLoadGroup instance) =>
    <String, dynamic>{
      'comps': instance.comps,
      'palletSeq': instance.palletSeq,
      'itemNo': instance.itemNo,
      'itemLot': instance.itemLot,
      'quantity': instance.quantity,
      'boxCnt': instance.boxCnt,
    };

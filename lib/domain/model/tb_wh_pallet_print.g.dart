// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_wh_pallet_print.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TbWhPalletPrint _$$_TbWhPalletPrintFromJson(Map<String, dynamic> json) =>
    _$_TbWhPalletPrint(
      comps: json['comps'] as String?,
      workshop: json['workshop'] as String?,
      total: json['total'] as int?,
      palletDate: json['palletDate'] == null
          ? null
          : DateTime.parse(json['palletDate'] as String),
      arrival: json['arrival'] as String?,
      printFlag: json['printFlag'] as String?,
      palletSeq: json['palletSeq'] as int?,
      departure: json['departure'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$_TbWhPalletPrintToJson(_$_TbWhPalletPrint instance) =>
    <String, dynamic>{
      'comps': instance.comps,
      'workshop': instance.workshop,
      'total': instance.total,
      'palletDate': instance.palletDate?.toIso8601String(),
      'arrival': instance.arrival,
      'printFlag': instance.printFlag,
      'palletSeq': instance.palletSeq,
      'departure': instance.departure,
      'state': instance.state,
    };

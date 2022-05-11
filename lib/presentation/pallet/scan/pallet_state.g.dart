// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pallet_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PalletState _$$_PalletStateFromJson(Map<String, dynamic> json) =>
    _$_PalletState(
      pallets: (json['pallets'] as List<dynamic>?)
          ?.map((e) => Pallet.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLoading: json['isLoading'] as bool,
    );

Map<String, dynamic> _$$_PalletStateToJson(_$_PalletState instance) =>
    <String, dynamic>{
      'pallets': instance.pallets,
      'isLoading': instance.isLoading,
    };

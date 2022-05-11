import 'package:kdlwms/domain/model/pallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pallet_state.freezed.dart';

part 'pallet_state.g.dart';

@freezed
class PalletState with _$PalletState {
  factory PalletState({
    required List<Pallet> pallets,
    required bool isLoading,
  }) = _PalletState;

  factory PalletState.fromJson(Map<String, dynamic> json) => _$PalletStateFromJson(json);
}
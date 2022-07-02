
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';

part 'setting_workshop_state.freezed.dart';
part 'setting_workshop_state.g.dart';

@freezed
class SettingInfoState with _$SettingInfoState {
  factory SettingInfoState({
    required List<TbCmLocation>? tbCmLocations,
    required bool isLoading,
  }) = _SettingWorkshopState;

  factory SettingInfoState.fromJson(Map<String, dynamic> json) => _$SettingInfoStateFromJson(json);
}
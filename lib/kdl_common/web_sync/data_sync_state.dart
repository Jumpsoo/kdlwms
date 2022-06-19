
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_sync_state.freezed.dart';
part 'data_sync_state.g.dart';

@freezed
class DataSyncState with _$DataSyncState{
  factory DataSyncState({
    required bool isLoading,
  }) = _DataSyncState;

  factory DataSyncState.fromJson(Map<String, dynamic> json) => _$DataSyncStateFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'comm_ui_events.freezed.dart';

@freezed
abstract class CommUiEvents<T> with _$CommUiEvents<T>{
  const factory CommUiEvents.showSnackBar(String message) = ShowSnackBar;
}
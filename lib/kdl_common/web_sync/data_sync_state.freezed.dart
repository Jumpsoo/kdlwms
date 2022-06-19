// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataSyncState _$DataSyncStateFromJson(Map<String, dynamic> json) {
  return _DataSyncState.fromJson(json);
}

/// @nodoc
mixin _$DataSyncState {
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataSyncStateCopyWith<DataSyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSyncStateCopyWith<$Res> {
  factory $DataSyncStateCopyWith(
          DataSyncState value, $Res Function(DataSyncState) then) =
      _$DataSyncStateCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class _$DataSyncStateCopyWithImpl<$Res>
    implements $DataSyncStateCopyWith<$Res> {
  _$DataSyncStateCopyWithImpl(this._value, this._then);

  final DataSyncState _value;
  // ignore: unused_field
  final $Res Function(DataSyncState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_DataSyncStateCopyWith<$Res>
    implements $DataSyncStateCopyWith<$Res> {
  factory _$$_DataSyncStateCopyWith(
          _$_DataSyncState value, $Res Function(_$_DataSyncState) then) =
      __$$_DataSyncStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_DataSyncStateCopyWithImpl<$Res>
    extends _$DataSyncStateCopyWithImpl<$Res>
    implements _$$_DataSyncStateCopyWith<$Res> {
  __$$_DataSyncStateCopyWithImpl(
      _$_DataSyncState _value, $Res Function(_$_DataSyncState) _then)
      : super(_value, (v) => _then(v as _$_DataSyncState));

  @override
  _$_DataSyncState get _value => super._value as _$_DataSyncState;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_$_DataSyncState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataSyncState implements _DataSyncState {
  _$_DataSyncState({required this.isLoading});

  factory _$_DataSyncState.fromJson(Map<String, dynamic> json) =>
      _$$_DataSyncStateFromJson(json);

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'DataSyncState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataSyncState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_DataSyncStateCopyWith<_$_DataSyncState> get copyWith =>
      __$$_DataSyncStateCopyWithImpl<_$_DataSyncState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataSyncStateToJson(this);
  }
}

abstract class _DataSyncState implements DataSyncState {
  factory _DataSyncState({required final bool isLoading}) = _$_DataSyncState;

  factory _DataSyncState.fromJson(Map<String, dynamic> json) =
      _$_DataSyncState.fromJson;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DataSyncStateCopyWith<_$_DataSyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

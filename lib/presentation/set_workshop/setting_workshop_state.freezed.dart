// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_workshop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingWorkshopState _$SettingWorkshopStateFromJson(Map<String, dynamic> json) {
  return _SettingWorkshopState.fromJson(json);
}

/// @nodoc
mixin _$SettingWorkshopState {
  List<TbCmLocation>? get tbCmLocations => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingWorkshopStateCopyWith<SettingWorkshopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingWorkshopStateCopyWith<$Res> {
  factory $SettingWorkshopStateCopyWith(SettingWorkshopState value,
          $Res Function(SettingWorkshopState) then) =
      _$SettingWorkshopStateCopyWithImpl<$Res>;
  $Res call({List<TbCmLocation>? tbCmLocations, bool isLoading});
}

/// @nodoc
class _$SettingWorkshopStateCopyWithImpl<$Res>
    implements $SettingWorkshopStateCopyWith<$Res> {
  _$SettingWorkshopStateCopyWithImpl(this._value, this._then);

  final SettingWorkshopState _value;
  // ignore: unused_field
  final $Res Function(SettingWorkshopState) _then;

  @override
  $Res call({
    Object? tbCmLocations = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      tbCmLocations: tbCmLocations == freezed
          ? _value.tbCmLocations
          : tbCmLocations // ignore: cast_nullable_to_non_nullable
              as List<TbCmLocation>?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingWorkshopStateCopyWith<$Res>
    implements $SettingWorkshopStateCopyWith<$Res> {
  factory _$$_SettingWorkshopStateCopyWith(_$_SettingWorkshopState value,
          $Res Function(_$_SettingWorkshopState) then) =
      __$$_SettingWorkshopStateCopyWithImpl<$Res>;
  @override
  $Res call({List<TbCmLocation>? tbCmLocations, bool isLoading});
}

/// @nodoc
class __$$_SettingWorkshopStateCopyWithImpl<$Res>
    extends _$SettingWorkshopStateCopyWithImpl<$Res>
    implements _$$_SettingWorkshopStateCopyWith<$Res> {
  __$$_SettingWorkshopStateCopyWithImpl(_$_SettingWorkshopState _value,
      $Res Function(_$_SettingWorkshopState) _then)
      : super(_value, (v) => _then(v as _$_SettingWorkshopState));

  @override
  _$_SettingWorkshopState get _value => super._value as _$_SettingWorkshopState;

  @override
  $Res call({
    Object? tbCmLocations = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_SettingWorkshopState(
      tbCmLocations: tbCmLocations == freezed
          ? _value._tbCmLocations
          : tbCmLocations // ignore: cast_nullable_to_non_nullable
              as List<TbCmLocation>?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingWorkshopState implements _SettingWorkshopState {
  _$_SettingWorkshopState(
      {required final List<TbCmLocation>? tbCmLocations,
      required this.isLoading})
      : _tbCmLocations = tbCmLocations;

  factory _$_SettingWorkshopState.fromJson(Map<String, dynamic> json) =>
      _$$_SettingWorkshopStateFromJson(json);

  final List<TbCmLocation>? _tbCmLocations;
  @override
  List<TbCmLocation>? get tbCmLocations {
    final value = _tbCmLocations;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'SettingWorkshopState(tbCmLocations: $tbCmLocations, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingWorkshopState &&
            const DeepCollectionEquality()
                .equals(other._tbCmLocations, _tbCmLocations) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tbCmLocations),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_SettingWorkshopStateCopyWith<_$_SettingWorkshopState> get copyWith =>
      __$$_SettingWorkshopStateCopyWithImpl<_$_SettingWorkshopState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingWorkshopStateToJson(this);
  }
}

abstract class _SettingWorkshopState implements SettingWorkshopState {
  factory _SettingWorkshopState(
      {required final List<TbCmLocation>? tbCmLocations,
      required final bool isLoading}) = _$_SettingWorkshopState;

  factory _SettingWorkshopState.fromJson(Map<String, dynamic> json) =
      _$_SettingWorkshopState.fromJson;

  @override
  List<TbCmLocation>? get tbCmLocations => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SettingWorkshopStateCopyWith<_$_SettingWorkshopState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tb_server_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TbServerInfo _$TbServerInfoFromJson(Map<String, dynamic> json) {
  return _TbServerInfo.fromJson(json);
}

/// @nodoc
mixin _$TbServerInfo {
  String get serverUrl => throw _privateConstructorUsedError;
  String? get comps => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  int? get vibrateState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TbServerInfoCopyWith<TbServerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TbServerInfoCopyWith<$Res> {
  factory $TbServerInfoCopyWith(
          TbServerInfo value, $Res Function(TbServerInfo) then) =
      _$TbServerInfoCopyWithImpl<$Res>;
  $Res call(
      {String serverUrl, String? comps, String? deviceId, int? vibrateState});
}

/// @nodoc
class _$TbServerInfoCopyWithImpl<$Res> implements $TbServerInfoCopyWith<$Res> {
  _$TbServerInfoCopyWithImpl(this._value, this._then);

  final TbServerInfo _value;
  // ignore: unused_field
  final $Res Function(TbServerInfo) _then;

  @override
  $Res call({
    Object? serverUrl = freezed,
    Object? comps = freezed,
    Object? deviceId = freezed,
    Object? vibrateState = freezed,
  }) {
    return _then(_value.copyWith(
      serverUrl: serverUrl == freezed
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      comps: comps == freezed
          ? _value.comps
          : comps // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      vibrateState: vibrateState == freezed
          ? _value.vibrateState
          : vibrateState // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TbServerInfoCopyWith<$Res>
    implements $TbServerInfoCopyWith<$Res> {
  factory _$$_TbServerInfoCopyWith(
          _$_TbServerInfo value, $Res Function(_$_TbServerInfo) then) =
      __$$_TbServerInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String serverUrl, String? comps, String? deviceId, int? vibrateState});
}

/// @nodoc
class __$$_TbServerInfoCopyWithImpl<$Res>
    extends _$TbServerInfoCopyWithImpl<$Res>
    implements _$$_TbServerInfoCopyWith<$Res> {
  __$$_TbServerInfoCopyWithImpl(
      _$_TbServerInfo _value, $Res Function(_$_TbServerInfo) _then)
      : super(_value, (v) => _then(v as _$_TbServerInfo));

  @override
  _$_TbServerInfo get _value => super._value as _$_TbServerInfo;

  @override
  $Res call({
    Object? serverUrl = freezed,
    Object? comps = freezed,
    Object? deviceId = freezed,
    Object? vibrateState = freezed,
  }) {
    return _then(_$_TbServerInfo(
      serverUrl: serverUrl == freezed
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      comps: comps == freezed
          ? _value.comps
          : comps // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      vibrateState: vibrateState == freezed
          ? _value.vibrateState
          : vibrateState // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TbServerInfo implements _TbServerInfo {
  _$_TbServerInfo(
      {required this.serverUrl, this.comps, this.deviceId, this.vibrateState});

  factory _$_TbServerInfo.fromJson(Map<String, dynamic> json) =>
      _$$_TbServerInfoFromJson(json);

  @override
  final String serverUrl;
  @override
  final String? comps;
  @override
  final String? deviceId;
  @override
  final int? vibrateState;

  @override
  String toString() {
    return 'TbServerInfo(serverUrl: $serverUrl, comps: $comps, deviceId: $deviceId, vibrateState: $vibrateState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TbServerInfo &&
            const DeepCollectionEquality().equals(other.serverUrl, serverUrl) &&
            const DeepCollectionEquality().equals(other.comps, comps) &&
            const DeepCollectionEquality().equals(other.deviceId, deviceId) &&
            const DeepCollectionEquality()
                .equals(other.vibrateState, vibrateState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serverUrl),
      const DeepCollectionEquality().hash(comps),
      const DeepCollectionEquality().hash(deviceId),
      const DeepCollectionEquality().hash(vibrateState));

  @JsonKey(ignore: true)
  @override
  _$$_TbServerInfoCopyWith<_$_TbServerInfo> get copyWith =>
      __$$_TbServerInfoCopyWithImpl<_$_TbServerInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TbServerInfoToJson(this);
  }
}

abstract class _TbServerInfo implements TbServerInfo {
  factory _TbServerInfo(
      {required final String serverUrl,
      final String? comps,
      final String? deviceId,
      final int? vibrateState}) = _$_TbServerInfo;

  factory _TbServerInfo.fromJson(Map<String, dynamic> json) =
      _$_TbServerInfo.fromJson;

  @override
  String get serverUrl => throw _privateConstructorUsedError;
  @override
  String? get comps => throw _privateConstructorUsedError;
  @override
  String? get deviceId => throw _privateConstructorUsedError;
  @override
  int? get vibrateState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TbServerInfoCopyWith<_$_TbServerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

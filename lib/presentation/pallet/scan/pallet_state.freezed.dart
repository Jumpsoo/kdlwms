// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pallet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PalletState _$PalletStateFromJson(Map<String, dynamic> json) {
  return _PalletState.fromJson(json);
}

/// @nodoc
mixin _$PalletState {
  List<TbWhPallet>? get pallets => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PalletStateCopyWith<PalletState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PalletStateCopyWith<$Res> {
  factory $PalletStateCopyWith(
          PalletState value, $Res Function(PalletState) then) =
      _$PalletStateCopyWithImpl<$Res>;
  $Res call({List<TbWhPallet>? pallets, bool isLoading});
}

/// @nodoc
class _$PalletStateCopyWithImpl<$Res> implements $PalletStateCopyWith<$Res> {
  _$PalletStateCopyWithImpl(this._value, this._then);

  final PalletState _value;
  // ignore: unused_field
  final $Res Function(PalletState) _then;

  @override
  $Res call({
    Object? pallets = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      pallets: pallets == freezed
          ? _value.pallets
          : pallets // ignore: cast_nullable_to_non_nullable
              as List<TbWhPallet>?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PalletStateCopyWith<$Res>
    implements $PalletStateCopyWith<$Res> {
  factory _$$_PalletStateCopyWith(
          _$_PalletState value, $Res Function(_$_PalletState) then) =
      __$$_PalletStateCopyWithImpl<$Res>;
  @override
  $Res call({List<TbWhPallet>? pallets, bool isLoading});
}

/// @nodoc
class __$$_PalletStateCopyWithImpl<$Res> extends _$PalletStateCopyWithImpl<$Res>
    implements _$$_PalletStateCopyWith<$Res> {
  __$$_PalletStateCopyWithImpl(
      _$_PalletState _value, $Res Function(_$_PalletState) _then)
      : super(_value, (v) => _then(v as _$_PalletState));

  @override
  _$_PalletState get _value => super._value as _$_PalletState;

  @override
  $Res call({
    Object? pallets = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_PalletState(
      pallets: pallets == freezed
          ? _value._pallets
          : pallets // ignore: cast_nullable_to_non_nullable
              as List<TbWhPallet>?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PalletState implements _PalletState {
  _$_PalletState(
      {required final List<TbWhPallet>? pallets, required this.isLoading})
      : _pallets = pallets;

  factory _$_PalletState.fromJson(Map<String, dynamic> json) =>
      _$$_PalletStateFromJson(json);

  final List<TbWhPallet>? _pallets;
  @override
  List<TbWhPallet>? get pallets {
    final value = _pallets;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PalletState(pallets: $pallets, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PalletState &&
            const DeepCollectionEquality().equals(other._pallets, _pallets) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pallets),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_PalletStateCopyWith<_$_PalletState> get copyWith =>
      __$$_PalletStateCopyWithImpl<_$_PalletState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PalletStateToJson(this);
  }
}

abstract class _PalletState implements PalletState {
  factory _PalletState(
      {required final List<TbWhPallet>? pallets,
      required final bool isLoading}) = _$_PalletState;

  factory _PalletState.fromJson(Map<String, dynamic> json) =
      _$_PalletState.fromJson;

  @override
  List<TbWhPallet>? get pallets => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PalletStateCopyWith<_$_PalletState> get copyWith =>
      throw _privateConstructorUsedError;
}

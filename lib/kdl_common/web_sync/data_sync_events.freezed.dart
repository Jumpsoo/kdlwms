// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_sync_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataSyncEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)
        migTbWhCmCode,
    required TResult Function(List<TbWhItem> tbWhItems) migTbWhItem,
    required TResult Function(List<TbCmLocation> tbCmLocations) migTbCmLocation,
    required TResult Function(List<TbCmSync> tbCmSyncs) migTbCmSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)?
        migTbWhCmCode,
    TResult Function(List<TbWhItem> tbWhItems)? migTbWhItem,
    TResult Function(List<TbCmLocation> tbCmLocations)? migTbCmLocation,
    TResult Function(List<TbCmSync> tbCmSyncs)? migTbCmSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)?
        migTbWhCmCode,
    TResult Function(List<TbWhItem> tbWhItems)? migTbWhItem,
    TResult Function(List<TbCmLocation> tbCmLocations)? migTbCmLocation,
    TResult Function(List<TbCmSync> tbCmSyncs)? migTbCmSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MigTbWhCmCode value) migTbWhCmCode,
    required TResult Function(MigTbWhItem value) migTbWhItem,
    required TResult Function(MigTbCmLocation value) migTbCmLocation,
    required TResult Function(MigTbCmSync value) migTbCmSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MigTbWhCmCode value)? migTbWhCmCode,
    TResult Function(MigTbWhItem value)? migTbWhItem,
    TResult Function(MigTbCmLocation value)? migTbCmLocation,
    TResult Function(MigTbCmSync value)? migTbCmSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigTbWhCmCode value)? migTbWhCmCode,
    TResult Function(MigTbWhItem value)? migTbWhItem,
    TResult Function(MigTbCmLocation value)? migTbCmLocation,
    TResult Function(MigTbCmSync value)? migTbCmSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSyncEventCopyWith<$Res> {
  factory $DataSyncEventCopyWith(
          DataSyncEvent value, $Res Function(DataSyncEvent) then) =
      _$DataSyncEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DataSyncEventCopyWithImpl<$Res>
    implements $DataSyncEventCopyWith<$Res> {
  _$DataSyncEventCopyWithImpl(this._value, this._then);

  final DataSyncEvent _value;
  // ignore: unused_field
  final $Res Function(DataSyncEvent) _then;
}

/// @nodoc
abstract class _$$MigTbWhCmCodeCopyWith<$Res> {
  factory _$$MigTbWhCmCodeCopyWith(
          _$MigTbWhCmCode value, $Res Function(_$MigTbWhCmCode) then) =
      __$$MigTbWhCmCodeCopyWithImpl<$Res>;
  $Res call({TbWhCmCode condTbWhCmCode, String sBachName});

  $TbWhCmCodeCopyWith<$Res> get condTbWhCmCode;
}

/// @nodoc
class __$$MigTbWhCmCodeCopyWithImpl<$Res>
    extends _$DataSyncEventCopyWithImpl<$Res>
    implements _$$MigTbWhCmCodeCopyWith<$Res> {
  __$$MigTbWhCmCodeCopyWithImpl(
      _$MigTbWhCmCode _value, $Res Function(_$MigTbWhCmCode) _then)
      : super(_value, (v) => _then(v as _$MigTbWhCmCode));

  @override
  _$MigTbWhCmCode get _value => super._value as _$MigTbWhCmCode;

  @override
  $Res call({
    Object? condTbWhCmCode = freezed,
    Object? sBachName = freezed,
  }) {
    return _then(_$MigTbWhCmCode(
      condTbWhCmCode == freezed
          ? _value.condTbWhCmCode
          : condTbWhCmCode // ignore: cast_nullable_to_non_nullable
              as TbWhCmCode,
      sBachName == freezed
          ? _value.sBachName
          : sBachName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $TbWhCmCodeCopyWith<$Res> get condTbWhCmCode {
    return $TbWhCmCodeCopyWith<$Res>(_value.condTbWhCmCode, (value) {
      return _then(_value.copyWith(condTbWhCmCode: value));
    });
  }
}

/// @nodoc

class _$MigTbWhCmCode implements MigTbWhCmCode {
  const _$MigTbWhCmCode(this.condTbWhCmCode, this.sBachName);

  @override
  final TbWhCmCode condTbWhCmCode;
  @override
  final String sBachName;

  @override
  String toString() {
    return 'DataSyncEvent.migTbWhCmCode(condTbWhCmCode: $condTbWhCmCode, sBachName: $sBachName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigTbWhCmCode &&
            const DeepCollectionEquality()
                .equals(other.condTbWhCmCode, condTbWhCmCode) &&
            const DeepCollectionEquality().equals(other.sBachName, sBachName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(condTbWhCmCode),
      const DeepCollectionEquality().hash(sBachName));

  @JsonKey(ignore: true)
  @override
  _$$MigTbWhCmCodeCopyWith<_$MigTbWhCmCode> get copyWith =>
      __$$MigTbWhCmCodeCopyWithImpl<_$MigTbWhCmCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)
        migTbWhCmCode,
    required TResult Function(List<TbWhItem> tbWhItems) migTbWhItem,
    required TResult Function(List<TbCmLocation> tbCmLocations) migTbCmLocation,
    required TResult Function(List<TbCmSync> tbCmSyncs) migTbCmSync,
  }) {
    return migTbWhCmCode(condTbWhCmCode, sBachName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)?
        migTbWhCmCode,
    TResult Function(List<TbWhItem> tbWhItems)? migTbWhItem,
    TResult Function(List<TbCmLocation> tbCmLocations)? migTbCmLocation,
    TResult Function(List<TbCmSync> tbCmSyncs)? migTbCmSync,
  }) {
    return migTbWhCmCode?.call(condTbWhCmCode, sBachName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)?
        migTbWhCmCode,
    TResult Function(List<TbWhItem> tbWhItems)? migTbWhItem,
    TResult Function(List<TbCmLocation> tbCmLocations)? migTbCmLocation,
    TResult Function(List<TbCmSync> tbCmSyncs)? migTbCmSync,
    required TResult orElse(),
  }) {
    if (migTbWhCmCode != null) {
      return migTbWhCmCode(condTbWhCmCode, sBachName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MigTbWhCmCode value) migTbWhCmCode,
    required TResult Function(MigTbWhItem value) migTbWhItem,
    required TResult Function(MigTbCmLocation value) migTbCmLocation,
    required TResult Function(MigTbCmSync value) migTbCmSync,
  }) {
    return migTbWhCmCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MigTbWhCmCode value)? migTbWhCmCode,
    TResult Function(MigTbWhItem value)? migTbWhItem,
    TResult Function(MigTbCmLocation value)? migTbCmLocation,
    TResult Function(MigTbCmSync value)? migTbCmSync,
  }) {
    return migTbWhCmCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigTbWhCmCode value)? migTbWhCmCode,
    TResult Function(MigTbWhItem value)? migTbWhItem,
    TResult Function(MigTbCmLocation value)? migTbCmLocation,
    TResult Function(MigTbCmSync value)? migTbCmSync,
    required TResult orElse(),
  }) {
    if (migTbWhCmCode != null) {
      return migTbWhCmCode(this);
    }
    return orElse();
  }
}

abstract class MigTbWhCmCode implements DataSyncEvent {
  const factory MigTbWhCmCode(
          final TbWhCmCode condTbWhCmCode, final String sBachName) =
      _$MigTbWhCmCode;

  TbWhCmCode get condTbWhCmCode => throw _privateConstructorUsedError;
  String get sBachName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$MigTbWhCmCodeCopyWith<_$MigTbWhCmCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MigTbWhItemCopyWith<$Res> {
  factory _$$MigTbWhItemCopyWith(
          _$MigTbWhItem value, $Res Function(_$MigTbWhItem) then) =
      __$$MigTbWhItemCopyWithImpl<$Res>;
  $Res call({List<TbWhItem> tbWhItems});
}

/// @nodoc
class __$$MigTbWhItemCopyWithImpl<$Res>
    extends _$DataSyncEventCopyWithImpl<$Res>
    implements _$$MigTbWhItemCopyWith<$Res> {
  __$$MigTbWhItemCopyWithImpl(
      _$MigTbWhItem _value, $Res Function(_$MigTbWhItem) _then)
      : super(_value, (v) => _then(v as _$MigTbWhItem));

  @override
  _$MigTbWhItem get _value => super._value as _$MigTbWhItem;

  @override
  $Res call({
    Object? tbWhItems = freezed,
  }) {
    return _then(_$MigTbWhItem(
      tbWhItems == freezed
          ? _value._tbWhItems
          : tbWhItems // ignore: cast_nullable_to_non_nullable
              as List<TbWhItem>,
    ));
  }
}

/// @nodoc

class _$MigTbWhItem implements MigTbWhItem {
  const _$MigTbWhItem(final List<TbWhItem> tbWhItems) : _tbWhItems = tbWhItems;

  final List<TbWhItem> _tbWhItems;
  @override
  List<TbWhItem> get tbWhItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tbWhItems);
  }

  @override
  String toString() {
    return 'DataSyncEvent.migTbWhItem(tbWhItems: $tbWhItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigTbWhItem &&
            const DeepCollectionEquality()
                .equals(other._tbWhItems, _tbWhItems));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tbWhItems));

  @JsonKey(ignore: true)
  @override
  _$$MigTbWhItemCopyWith<_$MigTbWhItem> get copyWith =>
      __$$MigTbWhItemCopyWithImpl<_$MigTbWhItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)
        migTbWhCmCode,
    required TResult Function(List<TbWhItem> tbWhItems) migTbWhItem,
    required TResult Function(List<TbCmLocation> tbCmLocations) migTbCmLocation,
    required TResult Function(List<TbCmSync> tbCmSyncs) migTbCmSync,
  }) {
    return migTbWhItem(tbWhItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)?
        migTbWhCmCode,
    TResult Function(List<TbWhItem> tbWhItems)? migTbWhItem,
    TResult Function(List<TbCmLocation> tbCmLocations)? migTbCmLocation,
    TResult Function(List<TbCmSync> tbCmSyncs)? migTbCmSync,
  }) {
    return migTbWhItem?.call(tbWhItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)?
        migTbWhCmCode,
    TResult Function(List<TbWhItem> tbWhItems)? migTbWhItem,
    TResult Function(List<TbCmLocation> tbCmLocations)? migTbCmLocation,
    TResult Function(List<TbCmSync> tbCmSyncs)? migTbCmSync,
    required TResult orElse(),
  }) {
    if (migTbWhItem != null) {
      return migTbWhItem(tbWhItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MigTbWhCmCode value) migTbWhCmCode,
    required TResult Function(MigTbWhItem value) migTbWhItem,
    required TResult Function(MigTbCmLocation value) migTbCmLocation,
    required TResult Function(MigTbCmSync value) migTbCmSync,
  }) {
    return migTbWhItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MigTbWhCmCode value)? migTbWhCmCode,
    TResult Function(MigTbWhItem value)? migTbWhItem,
    TResult Function(MigTbCmLocation value)? migTbCmLocation,
    TResult Function(MigTbCmSync value)? migTbCmSync,
  }) {
    return migTbWhItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigTbWhCmCode value)? migTbWhCmCode,
    TResult Function(MigTbWhItem value)? migTbWhItem,
    TResult Function(MigTbCmLocation value)? migTbCmLocation,
    TResult Function(MigTbCmSync value)? migTbCmSync,
    required TResult orElse(),
  }) {
    if (migTbWhItem != null) {
      return migTbWhItem(this);
    }
    return orElse();
  }
}

abstract class MigTbWhItem implements DataSyncEvent {
  const factory MigTbWhItem(final List<TbWhItem> tbWhItems) = _$MigTbWhItem;

  List<TbWhItem> get tbWhItems => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$MigTbWhItemCopyWith<_$MigTbWhItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MigTbCmLocationCopyWith<$Res> {
  factory _$$MigTbCmLocationCopyWith(
          _$MigTbCmLocation value, $Res Function(_$MigTbCmLocation) then) =
      __$$MigTbCmLocationCopyWithImpl<$Res>;
  $Res call({List<TbCmLocation> tbCmLocations});
}

/// @nodoc
class __$$MigTbCmLocationCopyWithImpl<$Res>
    extends _$DataSyncEventCopyWithImpl<$Res>
    implements _$$MigTbCmLocationCopyWith<$Res> {
  __$$MigTbCmLocationCopyWithImpl(
      _$MigTbCmLocation _value, $Res Function(_$MigTbCmLocation) _then)
      : super(_value, (v) => _then(v as _$MigTbCmLocation));

  @override
  _$MigTbCmLocation get _value => super._value as _$MigTbCmLocation;

  @override
  $Res call({
    Object? tbCmLocations = freezed,
  }) {
    return _then(_$MigTbCmLocation(
      tbCmLocations == freezed
          ? _value._tbCmLocations
          : tbCmLocations // ignore: cast_nullable_to_non_nullable
              as List<TbCmLocation>,
    ));
  }
}

/// @nodoc

class _$MigTbCmLocation implements MigTbCmLocation {
  const _$MigTbCmLocation(final List<TbCmLocation> tbCmLocations)
      : _tbCmLocations = tbCmLocations;

  final List<TbCmLocation> _tbCmLocations;
  @override
  List<TbCmLocation> get tbCmLocations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tbCmLocations);
  }

  @override
  String toString() {
    return 'DataSyncEvent.migTbCmLocation(tbCmLocations: $tbCmLocations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigTbCmLocation &&
            const DeepCollectionEquality()
                .equals(other._tbCmLocations, _tbCmLocations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tbCmLocations));

  @JsonKey(ignore: true)
  @override
  _$$MigTbCmLocationCopyWith<_$MigTbCmLocation> get copyWith =>
      __$$MigTbCmLocationCopyWithImpl<_$MigTbCmLocation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)
        migTbWhCmCode,
    required TResult Function(List<TbWhItem> tbWhItems) migTbWhItem,
    required TResult Function(List<TbCmLocation> tbCmLocations) migTbCmLocation,
    required TResult Function(List<TbCmSync> tbCmSyncs) migTbCmSync,
  }) {
    return migTbCmLocation(tbCmLocations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)?
        migTbWhCmCode,
    TResult Function(List<TbWhItem> tbWhItems)? migTbWhItem,
    TResult Function(List<TbCmLocation> tbCmLocations)? migTbCmLocation,
    TResult Function(List<TbCmSync> tbCmSyncs)? migTbCmSync,
  }) {
    return migTbCmLocation?.call(tbCmLocations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)?
        migTbWhCmCode,
    TResult Function(List<TbWhItem> tbWhItems)? migTbWhItem,
    TResult Function(List<TbCmLocation> tbCmLocations)? migTbCmLocation,
    TResult Function(List<TbCmSync> tbCmSyncs)? migTbCmSync,
    required TResult orElse(),
  }) {
    if (migTbCmLocation != null) {
      return migTbCmLocation(tbCmLocations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MigTbWhCmCode value) migTbWhCmCode,
    required TResult Function(MigTbWhItem value) migTbWhItem,
    required TResult Function(MigTbCmLocation value) migTbCmLocation,
    required TResult Function(MigTbCmSync value) migTbCmSync,
  }) {
    return migTbCmLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MigTbWhCmCode value)? migTbWhCmCode,
    TResult Function(MigTbWhItem value)? migTbWhItem,
    TResult Function(MigTbCmLocation value)? migTbCmLocation,
    TResult Function(MigTbCmSync value)? migTbCmSync,
  }) {
    return migTbCmLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigTbWhCmCode value)? migTbWhCmCode,
    TResult Function(MigTbWhItem value)? migTbWhItem,
    TResult Function(MigTbCmLocation value)? migTbCmLocation,
    TResult Function(MigTbCmSync value)? migTbCmSync,
    required TResult orElse(),
  }) {
    if (migTbCmLocation != null) {
      return migTbCmLocation(this);
    }
    return orElse();
  }
}

abstract class MigTbCmLocation implements DataSyncEvent {
  const factory MigTbCmLocation(final List<TbCmLocation> tbCmLocations) =
      _$MigTbCmLocation;

  List<TbCmLocation> get tbCmLocations => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$MigTbCmLocationCopyWith<_$MigTbCmLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MigTbCmSyncCopyWith<$Res> {
  factory _$$MigTbCmSyncCopyWith(
          _$MigTbCmSync value, $Res Function(_$MigTbCmSync) then) =
      __$$MigTbCmSyncCopyWithImpl<$Res>;
  $Res call({List<TbCmSync> tbCmSyncs});
}

/// @nodoc
class __$$MigTbCmSyncCopyWithImpl<$Res>
    extends _$DataSyncEventCopyWithImpl<$Res>
    implements _$$MigTbCmSyncCopyWith<$Res> {
  __$$MigTbCmSyncCopyWithImpl(
      _$MigTbCmSync _value, $Res Function(_$MigTbCmSync) _then)
      : super(_value, (v) => _then(v as _$MigTbCmSync));

  @override
  _$MigTbCmSync get _value => super._value as _$MigTbCmSync;

  @override
  $Res call({
    Object? tbCmSyncs = freezed,
  }) {
    return _then(_$MigTbCmSync(
      tbCmSyncs == freezed
          ? _value._tbCmSyncs
          : tbCmSyncs // ignore: cast_nullable_to_non_nullable
              as List<TbCmSync>,
    ));
  }
}

/// @nodoc

class _$MigTbCmSync implements MigTbCmSync {
  const _$MigTbCmSync(final List<TbCmSync> tbCmSyncs) : _tbCmSyncs = tbCmSyncs;

  final List<TbCmSync> _tbCmSyncs;
  @override
  List<TbCmSync> get tbCmSyncs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tbCmSyncs);
  }

  @override
  String toString() {
    return 'DataSyncEvent.migTbCmSync(tbCmSyncs: $tbCmSyncs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigTbCmSync &&
            const DeepCollectionEquality()
                .equals(other._tbCmSyncs, _tbCmSyncs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tbCmSyncs));

  @JsonKey(ignore: true)
  @override
  _$$MigTbCmSyncCopyWith<_$MigTbCmSync> get copyWith =>
      __$$MigTbCmSyncCopyWithImpl<_$MigTbCmSync>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)
        migTbWhCmCode,
    required TResult Function(List<TbWhItem> tbWhItems) migTbWhItem,
    required TResult Function(List<TbCmLocation> tbCmLocations) migTbCmLocation,
    required TResult Function(List<TbCmSync> tbCmSyncs) migTbCmSync,
  }) {
    return migTbCmSync(tbCmSyncs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)?
        migTbWhCmCode,
    TResult Function(List<TbWhItem> tbWhItems)? migTbWhItem,
    TResult Function(List<TbCmLocation> tbCmLocations)? migTbCmLocation,
    TResult Function(List<TbCmSync> tbCmSyncs)? migTbCmSync,
  }) {
    return migTbCmSync?.call(tbCmSyncs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TbWhCmCode condTbWhCmCode, String sBachName)?
        migTbWhCmCode,
    TResult Function(List<TbWhItem> tbWhItems)? migTbWhItem,
    TResult Function(List<TbCmLocation> tbCmLocations)? migTbCmLocation,
    TResult Function(List<TbCmSync> tbCmSyncs)? migTbCmSync,
    required TResult orElse(),
  }) {
    if (migTbCmSync != null) {
      return migTbCmSync(tbCmSyncs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MigTbWhCmCode value) migTbWhCmCode,
    required TResult Function(MigTbWhItem value) migTbWhItem,
    required TResult Function(MigTbCmLocation value) migTbCmLocation,
    required TResult Function(MigTbCmSync value) migTbCmSync,
  }) {
    return migTbCmSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MigTbWhCmCode value)? migTbWhCmCode,
    TResult Function(MigTbWhItem value)? migTbWhItem,
    TResult Function(MigTbCmLocation value)? migTbCmLocation,
    TResult Function(MigTbCmSync value)? migTbCmSync,
  }) {
    return migTbCmSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MigTbWhCmCode value)? migTbWhCmCode,
    TResult Function(MigTbWhItem value)? migTbWhItem,
    TResult Function(MigTbCmLocation value)? migTbCmLocation,
    TResult Function(MigTbCmSync value)? migTbCmSync,
    required TResult orElse(),
  }) {
    if (migTbCmSync != null) {
      return migTbCmSync(this);
    }
    return orElse();
  }
}

abstract class MigTbCmSync implements DataSyncEvent {
  const factory MigTbCmSync(final List<TbCmSync> tbCmSyncs) = _$MigTbCmSync;

  List<TbCmSync> get tbCmSyncs => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$MigTbCmSyncCopyWith<_$MigTbCmSync> get copyWith =>
      throw _privateConstructorUsedError;
}

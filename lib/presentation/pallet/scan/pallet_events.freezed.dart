// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pallet_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PalletEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sWorkShop, String sLocation, int nState)
        listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(List<TbWhPallet> pallets) updatePallet,
    required TResult Function(List<TbWhPallet> pallets) updatePalletState,
    required TResult Function(List<TbWhPallet> pallets) deletePallet,
    required TResult Function() deletePalletAll,
    required TResult Function() getPalletCountInDevice,
    required TResult Function(String sQRData) scanQRData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListPallets value) listPallets,
    required TResult Function(GetPalletBySeq value) getPalletBySeq,
    required TResult Function(AddPallet value) addPallet,
    required TResult Function(UpdatePallet value) updatePallet,
    required TResult Function(UpdatePalletState value) updatePalletState,
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(DeletePalletAll value) deletePalletAll,
    required TResult Function(GetPalletCountInDevice value)
        getPalletCountInDevice,
    required TResult Function(ScanQRData value) scanQRData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PalletEventCopyWith<$Res> {
  factory $PalletEventCopyWith(
          PalletEvent value, $Res Function(PalletEvent) then) =
      _$PalletEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PalletEventCopyWithImpl<$Res> implements $PalletEventCopyWith<$Res> {
  _$PalletEventCopyWithImpl(this._value, this._then);

  final PalletEvent _value;
  // ignore: unused_field
  final $Res Function(PalletEvent) _then;
}

/// @nodoc
abstract class _$$ListPalletsCopyWith<$Res> {
  factory _$$ListPalletsCopyWith(
          _$ListPallets value, $Res Function(_$ListPallets) then) =
      __$$ListPalletsCopyWithImpl<$Res>;
  $Res call({String sWorkShop, String sLocation, int nState});
}

/// @nodoc
class __$$ListPalletsCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements _$$ListPalletsCopyWith<$Res> {
  __$$ListPalletsCopyWithImpl(
      _$ListPallets _value, $Res Function(_$ListPallets) _then)
      : super(_value, (v) => _then(v as _$ListPallets));

  @override
  _$ListPallets get _value => super._value as _$ListPallets;

  @override
  $Res call({
    Object? sWorkShop = freezed,
    Object? sLocation = freezed,
    Object? nState = freezed,
  }) {
    return _then(_$ListPallets(
      sWorkShop == freezed
          ? _value.sWorkShop
          : sWorkShop // ignore: cast_nullable_to_non_nullable
              as String,
      sLocation == freezed
          ? _value.sLocation
          : sLocation // ignore: cast_nullable_to_non_nullable
              as String,
      nState == freezed
          ? _value.nState
          : nState // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ListPallets implements ListPallets {
  const _$ListPallets(this.sWorkShop, this.sLocation, this.nState);

  @override
  final String sWorkShop;
  @override
  final String sLocation;
  @override
  final int nState;

  @override
  String toString() {
    return 'PalletEvent.listPallets(sWorkShop: $sWorkShop, sLocation: $sLocation, nState: $nState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListPallets &&
            const DeepCollectionEquality().equals(other.sWorkShop, sWorkShop) &&
            const DeepCollectionEquality().equals(other.sLocation, sLocation) &&
            const DeepCollectionEquality().equals(other.nState, nState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sWorkShop),
      const DeepCollectionEquality().hash(sLocation),
      const DeepCollectionEquality().hash(nState));

  @JsonKey(ignore: true)
  @override
  _$$ListPalletsCopyWith<_$ListPallets> get copyWith =>
      __$$ListPalletsCopyWithImpl<_$ListPallets>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sWorkShop, String sLocation, int nState)
        listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(List<TbWhPallet> pallets) updatePallet,
    required TResult Function(List<TbWhPallet> pallets) updatePalletState,
    required TResult Function(List<TbWhPallet> pallets) deletePallet,
    required TResult Function() deletePalletAll,
    required TResult Function() getPalletCountInDevice,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return listPallets(sWorkShop, sLocation, nState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return listPallets?.call(sWorkShop, sLocation, nState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (listPallets != null) {
      return listPallets(sWorkShop, sLocation, nState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListPallets value) listPallets,
    required TResult Function(GetPalletBySeq value) getPalletBySeq,
    required TResult Function(AddPallet value) addPallet,
    required TResult Function(UpdatePallet value) updatePallet,
    required TResult Function(UpdatePalletState value) updatePalletState,
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(DeletePalletAll value) deletePalletAll,
    required TResult Function(GetPalletCountInDevice value)
        getPalletCountInDevice,
    required TResult Function(ScanQRData value) scanQRData,
  }) {
    return listPallets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
  }) {
    return listPallets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
    required TResult orElse(),
  }) {
    if (listPallets != null) {
      return listPallets(this);
    }
    return orElse();
  }
}

abstract class ListPallets implements PalletEvent {
  const factory ListPallets(
          final String sWorkShop, final String sLocation, final int nState) =
      _$ListPallets;

  String get sWorkShop => throw _privateConstructorUsedError;
  String get sLocation => throw _privateConstructorUsedError;
  int get nState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ListPalletsCopyWith<_$ListPallets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPalletBySeqCopyWith<$Res> {
  factory _$$GetPalletBySeqCopyWith(
          _$GetPalletBySeq value, $Res Function(_$GetPalletBySeq) then) =
      __$$GetPalletBySeqCopyWithImpl<$Res>;
  $Res call({int palletSeq});
}

/// @nodoc
class __$$GetPalletBySeqCopyWithImpl<$Res>
    extends _$PalletEventCopyWithImpl<$Res>
    implements _$$GetPalletBySeqCopyWith<$Res> {
  __$$GetPalletBySeqCopyWithImpl(
      _$GetPalletBySeq _value, $Res Function(_$GetPalletBySeq) _then)
      : super(_value, (v) => _then(v as _$GetPalletBySeq));

  @override
  _$GetPalletBySeq get _value => super._value as _$GetPalletBySeq;

  @override
  $Res call({
    Object? palletSeq = freezed,
  }) {
    return _then(_$GetPalletBySeq(
      palletSeq == freezed
          ? _value.palletSeq
          : palletSeq // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetPalletBySeq implements GetPalletBySeq {
  const _$GetPalletBySeq(this.palletSeq);

  @override
  final int palletSeq;

  @override
  String toString() {
    return 'PalletEvent.getPalletBySeq(palletSeq: $palletSeq)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPalletBySeq &&
            const DeepCollectionEquality().equals(other.palletSeq, palletSeq));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(palletSeq));

  @JsonKey(ignore: true)
  @override
  _$$GetPalletBySeqCopyWith<_$GetPalletBySeq> get copyWith =>
      __$$GetPalletBySeqCopyWithImpl<_$GetPalletBySeq>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sWorkShop, String sLocation, int nState)
        listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(List<TbWhPallet> pallets) updatePallet,
    required TResult Function(List<TbWhPallet> pallets) updatePalletState,
    required TResult Function(List<TbWhPallet> pallets) deletePallet,
    required TResult Function() deletePalletAll,
    required TResult Function() getPalletCountInDevice,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return getPalletBySeq(palletSeq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return getPalletBySeq?.call(palletSeq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (getPalletBySeq != null) {
      return getPalletBySeq(palletSeq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListPallets value) listPallets,
    required TResult Function(GetPalletBySeq value) getPalletBySeq,
    required TResult Function(AddPallet value) addPallet,
    required TResult Function(UpdatePallet value) updatePallet,
    required TResult Function(UpdatePalletState value) updatePalletState,
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(DeletePalletAll value) deletePalletAll,
    required TResult Function(GetPalletCountInDevice value)
        getPalletCountInDevice,
    required TResult Function(ScanQRData value) scanQRData,
  }) {
    return getPalletBySeq(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
  }) {
    return getPalletBySeq?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
    required TResult orElse(),
  }) {
    if (getPalletBySeq != null) {
      return getPalletBySeq(this);
    }
    return orElse();
  }
}

abstract class GetPalletBySeq implements PalletEvent {
  const factory GetPalletBySeq(final int palletSeq) = _$GetPalletBySeq;

  int get palletSeq => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$GetPalletBySeqCopyWith<_$GetPalletBySeq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPalletCopyWith<$Res> {
  factory _$$AddPalletCopyWith(
          _$AddPallet value, $Res Function(_$AddPallet) then) =
      __$$AddPalletCopyWithImpl<$Res>;
  $Res call({String sQRData});
}

/// @nodoc
class __$$AddPalletCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements _$$AddPalletCopyWith<$Res> {
  __$$AddPalletCopyWithImpl(
      _$AddPallet _value, $Res Function(_$AddPallet) _then)
      : super(_value, (v) => _then(v as _$AddPallet));

  @override
  _$AddPallet get _value => super._value as _$AddPallet;

  @override
  $Res call({
    Object? sQRData = freezed,
  }) {
    return _then(_$AddPallet(
      sQRData == freezed
          ? _value.sQRData
          : sQRData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddPallet implements AddPallet {
  const _$AddPallet(this.sQRData);

  @override
  final String sQRData;

  @override
  String toString() {
    return 'PalletEvent.addPallet(sQRData: $sQRData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPallet &&
            const DeepCollectionEquality().equals(other.sQRData, sQRData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sQRData));

  @JsonKey(ignore: true)
  @override
  _$$AddPalletCopyWith<_$AddPallet> get copyWith =>
      __$$AddPalletCopyWithImpl<_$AddPallet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sWorkShop, String sLocation, int nState)
        listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(List<TbWhPallet> pallets) updatePallet,
    required TResult Function(List<TbWhPallet> pallets) updatePalletState,
    required TResult Function(List<TbWhPallet> pallets) deletePallet,
    required TResult Function() deletePalletAll,
    required TResult Function() getPalletCountInDevice,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return addPallet(sQRData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return addPallet?.call(sQRData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (addPallet != null) {
      return addPallet(sQRData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListPallets value) listPallets,
    required TResult Function(GetPalletBySeq value) getPalletBySeq,
    required TResult Function(AddPallet value) addPallet,
    required TResult Function(UpdatePallet value) updatePallet,
    required TResult Function(UpdatePalletState value) updatePalletState,
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(DeletePalletAll value) deletePalletAll,
    required TResult Function(GetPalletCountInDevice value)
        getPalletCountInDevice,
    required TResult Function(ScanQRData value) scanQRData,
  }) {
    return addPallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
  }) {
    return addPallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
    required TResult orElse(),
  }) {
    if (addPallet != null) {
      return addPallet(this);
    }
    return orElse();
  }
}

abstract class AddPallet implements PalletEvent {
  const factory AddPallet(final String sQRData) = _$AddPallet;

  String get sQRData => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AddPalletCopyWith<_$AddPallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePalletCopyWith<$Res> {
  factory _$$UpdatePalletCopyWith(
          _$UpdatePallet value, $Res Function(_$UpdatePallet) then) =
      __$$UpdatePalletCopyWithImpl<$Res>;
  $Res call({List<TbWhPallet> pallets});
}

/// @nodoc
class __$$UpdatePalletCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements _$$UpdatePalletCopyWith<$Res> {
  __$$UpdatePalletCopyWithImpl(
      _$UpdatePallet _value, $Res Function(_$UpdatePallet) _then)
      : super(_value, (v) => _then(v as _$UpdatePallet));

  @override
  _$UpdatePallet get _value => super._value as _$UpdatePallet;

  @override
  $Res call({
    Object? pallets = freezed,
  }) {
    return _then(_$UpdatePallet(
      pallets == freezed
          ? _value._pallets
          : pallets // ignore: cast_nullable_to_non_nullable
              as List<TbWhPallet>,
    ));
  }
}

/// @nodoc

class _$UpdatePallet implements UpdatePallet {
  const _$UpdatePallet(final List<TbWhPallet> pallets) : _pallets = pallets;

  final List<TbWhPallet> _pallets;
  @override
  List<TbWhPallet> get pallets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pallets);
  }

  @override
  String toString() {
    return 'PalletEvent.updatePallet(pallets: $pallets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePallet &&
            const DeepCollectionEquality().equals(other._pallets, _pallets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pallets));

  @JsonKey(ignore: true)
  @override
  _$$UpdatePalletCopyWith<_$UpdatePallet> get copyWith =>
      __$$UpdatePalletCopyWithImpl<_$UpdatePallet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sWorkShop, String sLocation, int nState)
        listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(List<TbWhPallet> pallets) updatePallet,
    required TResult Function(List<TbWhPallet> pallets) updatePalletState,
    required TResult Function(List<TbWhPallet> pallets) deletePallet,
    required TResult Function() deletePalletAll,
    required TResult Function() getPalletCountInDevice,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return updatePallet(pallets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return updatePallet?.call(pallets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (updatePallet != null) {
      return updatePallet(pallets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListPallets value) listPallets,
    required TResult Function(GetPalletBySeq value) getPalletBySeq,
    required TResult Function(AddPallet value) addPallet,
    required TResult Function(UpdatePallet value) updatePallet,
    required TResult Function(UpdatePalletState value) updatePalletState,
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(DeletePalletAll value) deletePalletAll,
    required TResult Function(GetPalletCountInDevice value)
        getPalletCountInDevice,
    required TResult Function(ScanQRData value) scanQRData,
  }) {
    return updatePallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
  }) {
    return updatePallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
    required TResult orElse(),
  }) {
    if (updatePallet != null) {
      return updatePallet(this);
    }
    return orElse();
  }
}

abstract class UpdatePallet implements PalletEvent {
  const factory UpdatePallet(final List<TbWhPallet> pallets) = _$UpdatePallet;

  List<TbWhPallet> get pallets => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UpdatePalletCopyWith<_$UpdatePallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePalletStateCopyWith<$Res> {
  factory _$$UpdatePalletStateCopyWith(
          _$UpdatePalletState value, $Res Function(_$UpdatePalletState) then) =
      __$$UpdatePalletStateCopyWithImpl<$Res>;
  $Res call({List<TbWhPallet> pallets});
}

/// @nodoc
class __$$UpdatePalletStateCopyWithImpl<$Res>
    extends _$PalletEventCopyWithImpl<$Res>
    implements _$$UpdatePalletStateCopyWith<$Res> {
  __$$UpdatePalletStateCopyWithImpl(
      _$UpdatePalletState _value, $Res Function(_$UpdatePalletState) _then)
      : super(_value, (v) => _then(v as _$UpdatePalletState));

  @override
  _$UpdatePalletState get _value => super._value as _$UpdatePalletState;

  @override
  $Res call({
    Object? pallets = freezed,
  }) {
    return _then(_$UpdatePalletState(
      pallets == freezed
          ? _value._pallets
          : pallets // ignore: cast_nullable_to_non_nullable
              as List<TbWhPallet>,
    ));
  }
}

/// @nodoc

class _$UpdatePalletState implements UpdatePalletState {
  const _$UpdatePalletState(final List<TbWhPallet> pallets)
      : _pallets = pallets;

  final List<TbWhPallet> _pallets;
  @override
  List<TbWhPallet> get pallets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pallets);
  }

  @override
  String toString() {
    return 'PalletEvent.updatePalletState(pallets: $pallets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePalletState &&
            const DeepCollectionEquality().equals(other._pallets, _pallets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pallets));

  @JsonKey(ignore: true)
  @override
  _$$UpdatePalletStateCopyWith<_$UpdatePalletState> get copyWith =>
      __$$UpdatePalletStateCopyWithImpl<_$UpdatePalletState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sWorkShop, String sLocation, int nState)
        listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(List<TbWhPallet> pallets) updatePallet,
    required TResult Function(List<TbWhPallet> pallets) updatePalletState,
    required TResult Function(List<TbWhPallet> pallets) deletePallet,
    required TResult Function() deletePalletAll,
    required TResult Function() getPalletCountInDevice,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return updatePalletState(pallets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return updatePalletState?.call(pallets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (updatePalletState != null) {
      return updatePalletState(pallets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListPallets value) listPallets,
    required TResult Function(GetPalletBySeq value) getPalletBySeq,
    required TResult Function(AddPallet value) addPallet,
    required TResult Function(UpdatePallet value) updatePallet,
    required TResult Function(UpdatePalletState value) updatePalletState,
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(DeletePalletAll value) deletePalletAll,
    required TResult Function(GetPalletCountInDevice value)
        getPalletCountInDevice,
    required TResult Function(ScanQRData value) scanQRData,
  }) {
    return updatePalletState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
  }) {
    return updatePalletState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
    required TResult orElse(),
  }) {
    if (updatePalletState != null) {
      return updatePalletState(this);
    }
    return orElse();
  }
}

abstract class UpdatePalletState implements PalletEvent {
  const factory UpdatePalletState(final List<TbWhPallet> pallets) =
      _$UpdatePalletState;

  List<TbWhPallet> get pallets => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UpdatePalletStateCopyWith<_$UpdatePalletState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePalletCopyWith<$Res> {
  factory _$$DeletePalletCopyWith(
          _$DeletePallet value, $Res Function(_$DeletePallet) then) =
      __$$DeletePalletCopyWithImpl<$Res>;
  $Res call({List<TbWhPallet> pallets});
}

/// @nodoc
class __$$DeletePalletCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements _$$DeletePalletCopyWith<$Res> {
  __$$DeletePalletCopyWithImpl(
      _$DeletePallet _value, $Res Function(_$DeletePallet) _then)
      : super(_value, (v) => _then(v as _$DeletePallet));

  @override
  _$DeletePallet get _value => super._value as _$DeletePallet;

  @override
  $Res call({
    Object? pallets = freezed,
  }) {
    return _then(_$DeletePallet(
      pallets == freezed
          ? _value._pallets
          : pallets // ignore: cast_nullable_to_non_nullable
              as List<TbWhPallet>,
    ));
  }
}

/// @nodoc

class _$DeletePallet implements DeletePallet {
  const _$DeletePallet(final List<TbWhPallet> pallets) : _pallets = pallets;

  final List<TbWhPallet> _pallets;
  @override
  List<TbWhPallet> get pallets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pallets);
  }

  @override
  String toString() {
    return 'PalletEvent.deletePallet(pallets: $pallets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePallet &&
            const DeepCollectionEquality().equals(other._pallets, _pallets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pallets));

  @JsonKey(ignore: true)
  @override
  _$$DeletePalletCopyWith<_$DeletePallet> get copyWith =>
      __$$DeletePalletCopyWithImpl<_$DeletePallet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sWorkShop, String sLocation, int nState)
        listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(List<TbWhPallet> pallets) updatePallet,
    required TResult Function(List<TbWhPallet> pallets) updatePalletState,
    required TResult Function(List<TbWhPallet> pallets) deletePallet,
    required TResult Function() deletePalletAll,
    required TResult Function() getPalletCountInDevice,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return deletePallet(pallets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return deletePallet?.call(pallets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (deletePallet != null) {
      return deletePallet(pallets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListPallets value) listPallets,
    required TResult Function(GetPalletBySeq value) getPalletBySeq,
    required TResult Function(AddPallet value) addPallet,
    required TResult Function(UpdatePallet value) updatePallet,
    required TResult Function(UpdatePalletState value) updatePalletState,
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(DeletePalletAll value) deletePalletAll,
    required TResult Function(GetPalletCountInDevice value)
        getPalletCountInDevice,
    required TResult Function(ScanQRData value) scanQRData,
  }) {
    return deletePallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
  }) {
    return deletePallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
    required TResult orElse(),
  }) {
    if (deletePallet != null) {
      return deletePallet(this);
    }
    return orElse();
  }
}

abstract class DeletePallet implements PalletEvent {
  const factory DeletePallet(final List<TbWhPallet> pallets) = _$DeletePallet;

  List<TbWhPallet> get pallets => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DeletePalletCopyWith<_$DeletePallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePalletAllCopyWith<$Res> {
  factory _$$DeletePalletAllCopyWith(
          _$DeletePalletAll value, $Res Function(_$DeletePalletAll) then) =
      __$$DeletePalletAllCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletePalletAllCopyWithImpl<$Res>
    extends _$PalletEventCopyWithImpl<$Res>
    implements _$$DeletePalletAllCopyWith<$Res> {
  __$$DeletePalletAllCopyWithImpl(
      _$DeletePalletAll _value, $Res Function(_$DeletePalletAll) _then)
      : super(_value, (v) => _then(v as _$DeletePalletAll));

  @override
  _$DeletePalletAll get _value => super._value as _$DeletePalletAll;
}

/// @nodoc

class _$DeletePalletAll implements DeletePalletAll {
  const _$DeletePalletAll();

  @override
  String toString() {
    return 'PalletEvent.deletePalletAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletePalletAll);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sWorkShop, String sLocation, int nState)
        listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(List<TbWhPallet> pallets) updatePallet,
    required TResult Function(List<TbWhPallet> pallets) updatePalletState,
    required TResult Function(List<TbWhPallet> pallets) deletePallet,
    required TResult Function() deletePalletAll,
    required TResult Function() getPalletCountInDevice,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return deletePalletAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return deletePalletAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (deletePalletAll != null) {
      return deletePalletAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListPallets value) listPallets,
    required TResult Function(GetPalletBySeq value) getPalletBySeq,
    required TResult Function(AddPallet value) addPallet,
    required TResult Function(UpdatePallet value) updatePallet,
    required TResult Function(UpdatePalletState value) updatePalletState,
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(DeletePalletAll value) deletePalletAll,
    required TResult Function(GetPalletCountInDevice value)
        getPalletCountInDevice,
    required TResult Function(ScanQRData value) scanQRData,
  }) {
    return deletePalletAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
  }) {
    return deletePalletAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
    required TResult orElse(),
  }) {
    if (deletePalletAll != null) {
      return deletePalletAll(this);
    }
    return orElse();
  }
}

abstract class DeletePalletAll implements PalletEvent {
  const factory DeletePalletAll() = _$DeletePalletAll;
}

/// @nodoc
abstract class _$$GetPalletCountInDeviceCopyWith<$Res> {
  factory _$$GetPalletCountInDeviceCopyWith(_$GetPalletCountInDevice value,
          $Res Function(_$GetPalletCountInDevice) then) =
      __$$GetPalletCountInDeviceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPalletCountInDeviceCopyWithImpl<$Res>
    extends _$PalletEventCopyWithImpl<$Res>
    implements _$$GetPalletCountInDeviceCopyWith<$Res> {
  __$$GetPalletCountInDeviceCopyWithImpl(_$GetPalletCountInDevice _value,
      $Res Function(_$GetPalletCountInDevice) _then)
      : super(_value, (v) => _then(v as _$GetPalletCountInDevice));

  @override
  _$GetPalletCountInDevice get _value =>
      super._value as _$GetPalletCountInDevice;
}

/// @nodoc

class _$GetPalletCountInDevice implements GetPalletCountInDevice {
  const _$GetPalletCountInDevice();

  @override
  String toString() {
    return 'PalletEvent.getPalletCountInDevice()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPalletCountInDevice);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sWorkShop, String sLocation, int nState)
        listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(List<TbWhPallet> pallets) updatePallet,
    required TResult Function(List<TbWhPallet> pallets) updatePalletState,
    required TResult Function(List<TbWhPallet> pallets) deletePallet,
    required TResult Function() deletePalletAll,
    required TResult Function() getPalletCountInDevice,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return getPalletCountInDevice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return getPalletCountInDevice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (getPalletCountInDevice != null) {
      return getPalletCountInDevice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListPallets value) listPallets,
    required TResult Function(GetPalletBySeq value) getPalletBySeq,
    required TResult Function(AddPallet value) addPallet,
    required TResult Function(UpdatePallet value) updatePallet,
    required TResult Function(UpdatePalletState value) updatePalletState,
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(DeletePalletAll value) deletePalletAll,
    required TResult Function(GetPalletCountInDevice value)
        getPalletCountInDevice,
    required TResult Function(ScanQRData value) scanQRData,
  }) {
    return getPalletCountInDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
  }) {
    return getPalletCountInDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
    required TResult orElse(),
  }) {
    if (getPalletCountInDevice != null) {
      return getPalletCountInDevice(this);
    }
    return orElse();
  }
}

abstract class GetPalletCountInDevice implements PalletEvent {
  const factory GetPalletCountInDevice() = _$GetPalletCountInDevice;
}

/// @nodoc
abstract class _$$ScanQRDataCopyWith<$Res> {
  factory _$$ScanQRDataCopyWith(
          _$ScanQRData value, $Res Function(_$ScanQRData) then) =
      __$$ScanQRDataCopyWithImpl<$Res>;
  $Res call({String sQRData});
}

/// @nodoc
class __$$ScanQRDataCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements _$$ScanQRDataCopyWith<$Res> {
  __$$ScanQRDataCopyWithImpl(
      _$ScanQRData _value, $Res Function(_$ScanQRData) _then)
      : super(_value, (v) => _then(v as _$ScanQRData));

  @override
  _$ScanQRData get _value => super._value as _$ScanQRData;

  @override
  $Res call({
    Object? sQRData = freezed,
  }) {
    return _then(_$ScanQRData(
      sQRData == freezed
          ? _value.sQRData
          : sQRData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScanQRData implements ScanQRData {
  const _$ScanQRData(this.sQRData);

  @override
  final String sQRData;

  @override
  String toString() {
    return 'PalletEvent.scanQRData(sQRData: $sQRData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanQRData &&
            const DeepCollectionEquality().equals(other.sQRData, sQRData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sQRData));

  @JsonKey(ignore: true)
  @override
  _$$ScanQRDataCopyWith<_$ScanQRData> get copyWith =>
      __$$ScanQRDataCopyWithImpl<_$ScanQRData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sWorkShop, String sLocation, int nState)
        listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(List<TbWhPallet> pallets) updatePallet,
    required TResult Function(List<TbWhPallet> pallets) updatePalletState,
    required TResult Function(List<TbWhPallet> pallets) deletePallet,
    required TResult Function() deletePalletAll,
    required TResult Function() getPalletCountInDevice,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return scanQRData(sQRData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return scanQRData?.call(sQRData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sWorkShop, String sLocation, int nState)?
        listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(List<TbWhPallet> pallets)? updatePallet,
    TResult Function(List<TbWhPallet> pallets)? updatePalletState,
    TResult Function(List<TbWhPallet> pallets)? deletePallet,
    TResult Function()? deletePalletAll,
    TResult Function()? getPalletCountInDevice,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (scanQRData != null) {
      return scanQRData(sQRData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListPallets value) listPallets,
    required TResult Function(GetPalletBySeq value) getPalletBySeq,
    required TResult Function(AddPallet value) addPallet,
    required TResult Function(UpdatePallet value) updatePallet,
    required TResult Function(UpdatePalletState value) updatePalletState,
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(DeletePalletAll value) deletePalletAll,
    required TResult Function(GetPalletCountInDevice value)
        getPalletCountInDevice,
    required TResult Function(ScanQRData value) scanQRData,
  }) {
    return scanQRData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
  }) {
    return scanQRData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(UpdatePalletState value)? updatePalletState,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(DeletePalletAll value)? deletePalletAll,
    TResult Function(GetPalletCountInDevice value)? getPalletCountInDevice,
    TResult Function(ScanQRData value)? scanQRData,
    required TResult orElse(),
  }) {
    if (scanQRData != null) {
      return scanQRData(this);
    }
    return orElse();
  }
}

abstract class ScanQRData implements PalletEvent {
  const factory ScanQRData(final String sQRData) = _$ScanQRData;

  String get sQRData => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ScanQRDataCopyWith<_$ScanQRData> get copyWith =>
      throw _privateConstructorUsedError;
}

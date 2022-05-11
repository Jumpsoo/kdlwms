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
    required TResult Function(String workShop) listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(Pallet pallet) updatePallet,
    required TResult Function(Pallet pallet) deletePallet,
    required TResult Function(String sQRData) scanQRData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
    TResult Function(String sQRData)? scanQRData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
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
    required TResult Function(DeletePallet value) deletePallet,
    required TResult Function(ScanQRData value) scanQRData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(DeletePallet value)? deletePallet,
    TResult Function(ScanQRData value)? scanQRData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListPallets value)? listPallets,
    TResult Function(GetPalletBySeq value)? getPalletBySeq,
    TResult Function(AddPallet value)? addPallet,
    TResult Function(UpdatePallet value)? updatePallet,
    TResult Function(DeletePallet value)? deletePallet,
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
abstract class $ListPalletsCopyWith<$Res> {
  factory $ListPalletsCopyWith(
          ListPallets value, $Res Function(ListPallets) then) =
      _$ListPalletsCopyWithImpl<$Res>;
  $Res call({String workShop});
}

/// @nodoc
class _$ListPalletsCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements $ListPalletsCopyWith<$Res> {
  _$ListPalletsCopyWithImpl(
      ListPallets _value, $Res Function(ListPallets) _then)
      : super(_value, (v) => _then(v as ListPallets));

  @override
  ListPallets get _value => super._value as ListPallets;

  @override
  $Res call({
    Object? workShop = freezed,
  }) {
    return _then(ListPallets(
      workShop == freezed
          ? _value.workShop
          : workShop // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ListPallets implements ListPallets {
  const _$ListPallets(this.workShop);

  @override
  final String workShop;

  @override
  String toString() {
    return 'PalletEvent.listPallets(workShop: $workShop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListPallets &&
            const DeepCollectionEquality().equals(other.workShop, workShop));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(workShop));

  @JsonKey(ignore: true)
  @override
  $ListPalletsCopyWith<ListPallets> get copyWith =>
      _$ListPalletsCopyWithImpl<ListPallets>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String workShop) listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(Pallet pallet) updatePallet,
    required TResult Function(Pallet pallet) deletePallet,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return listPallets(workShop);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return listPallets?.call(workShop);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (listPallets != null) {
      return listPallets(workShop);
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
    required TResult Function(DeletePallet value) deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
  const factory ListPallets(final String workShop) = _$ListPallets;

  String get workShop => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListPalletsCopyWith<ListPallets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPalletBySeqCopyWith<$Res> {
  factory $GetPalletBySeqCopyWith(
          GetPalletBySeq value, $Res Function(GetPalletBySeq) then) =
      _$GetPalletBySeqCopyWithImpl<$Res>;
  $Res call({int palletSeq});
}

/// @nodoc
class _$GetPalletBySeqCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements $GetPalletBySeqCopyWith<$Res> {
  _$GetPalletBySeqCopyWithImpl(
      GetPalletBySeq _value, $Res Function(GetPalletBySeq) _then)
      : super(_value, (v) => _then(v as GetPalletBySeq));

  @override
  GetPalletBySeq get _value => super._value as GetPalletBySeq;

  @override
  $Res call({
    Object? palletSeq = freezed,
  }) {
    return _then(GetPalletBySeq(
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
            other is GetPalletBySeq &&
            const DeepCollectionEquality().equals(other.palletSeq, palletSeq));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(palletSeq));

  @JsonKey(ignore: true)
  @override
  $GetPalletBySeqCopyWith<GetPalletBySeq> get copyWith =>
      _$GetPalletBySeqCopyWithImpl<GetPalletBySeq>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String workShop) listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(Pallet pallet) updatePallet,
    required TResult Function(Pallet pallet) deletePallet,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return getPalletBySeq(palletSeq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return getPalletBySeq?.call(palletSeq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
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
    required TResult Function(DeletePallet value) deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
  $GetPalletBySeqCopyWith<GetPalletBySeq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPalletCopyWith<$Res> {
  factory $AddPalletCopyWith(AddPallet value, $Res Function(AddPallet) then) =
      _$AddPalletCopyWithImpl<$Res>;
  $Res call({String sQRData});
}

/// @nodoc
class _$AddPalletCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements $AddPalletCopyWith<$Res> {
  _$AddPalletCopyWithImpl(AddPallet _value, $Res Function(AddPallet) _then)
      : super(_value, (v) => _then(v as AddPallet));

  @override
  AddPallet get _value => super._value as AddPallet;

  @override
  $Res call({
    Object? sQRData = freezed,
  }) {
    return _then(AddPallet(
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
            other is AddPallet &&
            const DeepCollectionEquality().equals(other.sQRData, sQRData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sQRData));

  @JsonKey(ignore: true)
  @override
  $AddPalletCopyWith<AddPallet> get copyWith =>
      _$AddPalletCopyWithImpl<AddPallet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String workShop) listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(Pallet pallet) updatePallet,
    required TResult Function(Pallet pallet) deletePallet,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return addPallet(sQRData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return addPallet?.call(sQRData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
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
    required TResult Function(DeletePallet value) deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
  $AddPalletCopyWith<AddPallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePalletCopyWith<$Res> {
  factory $UpdatePalletCopyWith(
          UpdatePallet value, $Res Function(UpdatePallet) then) =
      _$UpdatePalletCopyWithImpl<$Res>;
  $Res call({Pallet pallet});

  $PalletCopyWith<$Res> get pallet;
}

/// @nodoc
class _$UpdatePalletCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements $UpdatePalletCopyWith<$Res> {
  _$UpdatePalletCopyWithImpl(
      UpdatePallet _value, $Res Function(UpdatePallet) _then)
      : super(_value, (v) => _then(v as UpdatePallet));

  @override
  UpdatePallet get _value => super._value as UpdatePallet;

  @override
  $Res call({
    Object? pallet = freezed,
  }) {
    return _then(UpdatePallet(
      pallet == freezed
          ? _value.pallet
          : pallet // ignore: cast_nullable_to_non_nullable
              as Pallet,
    ));
  }

  @override
  $PalletCopyWith<$Res> get pallet {
    return $PalletCopyWith<$Res>(_value.pallet, (value) {
      return _then(_value.copyWith(pallet: value));
    });
  }
}

/// @nodoc

class _$UpdatePallet implements UpdatePallet {
  const _$UpdatePallet(this.pallet);

  @override
  final Pallet pallet;

  @override
  String toString() {
    return 'PalletEvent.updatePallet(pallet: $pallet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePallet &&
            const DeepCollectionEquality().equals(other.pallet, pallet));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(pallet));

  @JsonKey(ignore: true)
  @override
  $UpdatePalletCopyWith<UpdatePallet> get copyWith =>
      _$UpdatePalletCopyWithImpl<UpdatePallet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String workShop) listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(Pallet pallet) updatePallet,
    required TResult Function(Pallet pallet) deletePallet,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return updatePallet(pallet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return updatePallet?.call(pallet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (updatePallet != null) {
      return updatePallet(pallet);
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
    required TResult Function(DeletePallet value) deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
  const factory UpdatePallet(final Pallet pallet) = _$UpdatePallet;

  Pallet get pallet => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePalletCopyWith<UpdatePallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletePalletCopyWith<$Res> {
  factory $DeletePalletCopyWith(
          DeletePallet value, $Res Function(DeletePallet) then) =
      _$DeletePalletCopyWithImpl<$Res>;
  $Res call({Pallet pallet});

  $PalletCopyWith<$Res> get pallet;
}

/// @nodoc
class _$DeletePalletCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements $DeletePalletCopyWith<$Res> {
  _$DeletePalletCopyWithImpl(
      DeletePallet _value, $Res Function(DeletePallet) _then)
      : super(_value, (v) => _then(v as DeletePallet));

  @override
  DeletePallet get _value => super._value as DeletePallet;

  @override
  $Res call({
    Object? pallet = freezed,
  }) {
    return _then(DeletePallet(
      pallet == freezed
          ? _value.pallet
          : pallet // ignore: cast_nullable_to_non_nullable
              as Pallet,
    ));
  }

  @override
  $PalletCopyWith<$Res> get pallet {
    return $PalletCopyWith<$Res>(_value.pallet, (value) {
      return _then(_value.copyWith(pallet: value));
    });
  }
}

/// @nodoc

class _$DeletePallet implements DeletePallet {
  const _$DeletePallet(this.pallet);

  @override
  final Pallet pallet;

  @override
  String toString() {
    return 'PalletEvent.deletePallet(pallet: $pallet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeletePallet &&
            const DeepCollectionEquality().equals(other.pallet, pallet));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(pallet));

  @JsonKey(ignore: true)
  @override
  $DeletePalletCopyWith<DeletePallet> get copyWith =>
      _$DeletePalletCopyWithImpl<DeletePallet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String workShop) listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(Pallet pallet) updatePallet,
    required TResult Function(Pallet pallet) deletePallet,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return deletePallet(pallet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return deletePallet?.call(pallet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
    TResult Function(String sQRData)? scanQRData,
    required TResult orElse(),
  }) {
    if (deletePallet != null) {
      return deletePallet(pallet);
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
    required TResult Function(DeletePallet value) deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
  const factory DeletePallet(final Pallet pallet) = _$DeletePallet;

  Pallet get pallet => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeletePalletCopyWith<DeletePallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanQRDataCopyWith<$Res> {
  factory $ScanQRDataCopyWith(
          ScanQRData value, $Res Function(ScanQRData) then) =
      _$ScanQRDataCopyWithImpl<$Res>;
  $Res call({String sQRData});
}

/// @nodoc
class _$ScanQRDataCopyWithImpl<$Res> extends _$PalletEventCopyWithImpl<$Res>
    implements $ScanQRDataCopyWith<$Res> {
  _$ScanQRDataCopyWithImpl(ScanQRData _value, $Res Function(ScanQRData) _then)
      : super(_value, (v) => _then(v as ScanQRData));

  @override
  ScanQRData get _value => super._value as ScanQRData;

  @override
  $Res call({
    Object? sQRData = freezed,
  }) {
    return _then(ScanQRData(
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
            other is ScanQRData &&
            const DeepCollectionEquality().equals(other.sQRData, sQRData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sQRData));

  @JsonKey(ignore: true)
  @override
  $ScanQRDataCopyWith<ScanQRData> get copyWith =>
      _$ScanQRDataCopyWithImpl<ScanQRData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String workShop) listPallets,
    required TResult Function(int palletSeq) getPalletBySeq,
    required TResult Function(String sQRData) addPallet,
    required TResult Function(Pallet pallet) updatePallet,
    required TResult Function(Pallet pallet) deletePallet,
    required TResult Function(String sQRData) scanQRData,
  }) {
    return scanQRData(sQRData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
    TResult Function(String sQRData)? scanQRData,
  }) {
    return scanQRData?.call(sQRData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String workShop)? listPallets,
    TResult Function(int palletSeq)? getPalletBySeq,
    TResult Function(String sQRData)? addPallet,
    TResult Function(Pallet pallet)? updatePallet,
    TResult Function(Pallet pallet)? deletePallet,
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
    required TResult Function(DeletePallet value) deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
    TResult Function(DeletePallet value)? deletePallet,
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
  $ScanQRDataCopyWith<ScanQRData> get copyWith =>
      throw _privateConstructorUsedError;
}

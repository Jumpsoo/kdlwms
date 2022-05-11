import 'package:freezed_annotation/freezed_annotation.dart';

part 'pallet.freezed.dart';

part 'pallet.g.dart';

@freezed
class Pallet with _$Pallet {
  factory Pallet({
    required int PALLET_SEQ,
    required String WORKSHOP,
    required String LOCATION,
    required String ITEM_NO,
    required String ITEM_LOT,
    required int QUANTITY,
    required int STATE,
    required String BARCODE,
    required DateTime SCAN_DATE,
    required String SCAN_USERNM,
    required int BOX_NO,
    String? PRINT_FLAG,
    DateTime? PRINT_DATE,
    String? PRINT_USER,
    String? AS400IF_FLAG,
    DateTime? AS400IF_DATE,
    String? AS400IF_USER,
    int? RGSTR_ID,
    DateTime? RGST_DT,
    int? UPDTR_ID,
    DateTime? UPDT_DT,}) = _Pallet;

  factory Pallet.fromJson(Map<String, dynamic> json) => _$PalletFromJson(json);
}

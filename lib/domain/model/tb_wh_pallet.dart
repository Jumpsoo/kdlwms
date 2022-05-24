import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_wh_pallet.freezed.dart';

part 'tb_wh_pallet.g.dart';

@freezed
class TbWhPallet with _$TbWhPallet {
  factory TbWhPallet({
    required int PALLET_SEQ,
    String? WORKSHOP,
    String? LOCATION,
    String? ITEM_NO,
    String? ITEM_LOT,
    int? QUANTITY,
    int? STATE,
    String? BARCODE,
    DateTime? SCAN_DATE,
    String? SCAN_USERNM,
    int? BOX_NO,
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

  factory TbWhPallet.fromJson(Map<String, dynamic> json) => _$TbWhPalletFromJson(json);
}

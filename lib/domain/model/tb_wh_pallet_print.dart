import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_wh_pallet_print.freezed.dart';
part 'tb_wh_pallet_print.g.dart';

@freezed
class TbWhPalletPrint with _$TbWhPalletPrint {
  factory TbWhPalletPrint({
    String? comps,
    int? total ,
    DateTime? palletDate,
    String? arrival,
    String? printFlag,
    int? palletSeq,
    String? departure ,
    String? state,
  }) = _TbWhPalletPrint;

  factory TbWhPalletPrint.fromJson(Map<String, dynamic> json) => _$TbWhPalletPrintFromJson(json);
}

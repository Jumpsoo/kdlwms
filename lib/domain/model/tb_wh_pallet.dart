import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_wh_pallet.freezed.dart';

part 'tb_wh_pallet.g.dart';

@freezed
class TbWhPallet with _$TbWhPallet {
  factory TbWhPallet({
    String? comps ,
    int? palletSeq ,
    String? workshop,
    String? location,
    String? itemNo,
    String? itemLot ,
    int? quantity,
    int? state ,
    String? barcode ,
    DateTime? scanDate,
    String? scanUsernm,
    int? boxNo ,
    String? printFlag ,
    DateTime? printDate ,
    String? printUser ,
    String? as400IfFlag ,
    DateTime? as400IfDate ,
    String? as400IfUser ,
    int? rgstrId ,
    DateTime? rgstDt,
    int? updtrId ,
    DateTime? updtDt,
  }) = _TbWhPallet;

  factory TbWhPallet.fromJson(Map<String, dynamic> json) => _$TbWhPalletFromJson(json);
}

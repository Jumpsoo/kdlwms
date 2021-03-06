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
    String? state ,
    String? barcode ,
    DateTime? scanDate,
    String? scanUsernm,
    int? boxNo ,
    String? arrival,
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


@freezed
class TbWhPalletGroup with _$TbWhPalletGroup {
  factory TbWhPalletGroup({
    String? comps ,
    int? palletSeq,
    String? itemNo,
    String? itemLot ,
    int? quantity,
    int? boxCnt,
  }) = _TbWhPalletGroup;

  factory TbWhPalletGroup.fromJson(Map<String, dynamic> json) => _$TbWhPalletGroupFromJson(json);
}


@freezed
class TbWhPalletForDelete with _$TbWhPalletForDelete {
  factory TbWhPalletForDelete({
    String? comps ,
    String? location,
    String? locationNm,
    String? arrival ,
    String? arrivalNm ,
    int? boxCnt ,
  }) = _TbWhPalletForDelete;

  factory TbWhPalletForDelete.fromJson(Map<String, dynamic> json) => _$TbWhPalletForDeleteFromJson(json);
}


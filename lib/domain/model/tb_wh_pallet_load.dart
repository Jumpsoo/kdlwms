import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_wh_pallet_load.freezed.dart';

part 'tb_wh_pallet_load.g.dart';

@freezed
class TbWhPalletLoad with _$TbWhPalletLoad {
  factory TbWhPalletLoad({
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
  }) = _TbWhPalletLoad;

  factory TbWhPalletLoad.fromJson(Map<String, dynamic> json) => _$TbWhPalletLoadFromJson(json);
}


@freezed
class TbWhPalletLoadGroup with _$TbWhPalletLoadGroup{
  factory TbWhPalletLoadGroup({
    String? comps ,
    int? palletSeq,
    String? itemNo,
    String? itemLot ,
    int? quantity,
    int? boxCnt,
  }) = _TbWhPalletLoadGroup;

  factory TbWhPalletLoadGroup.fromJson(Map<String, dynamic> json) => _$TbWhPalletLoadGroupFromJson(json);
}


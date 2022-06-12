import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_wh_item.freezed.dart';

part 'tb_wh_item.g.dart';

@freezed
class TbWhItem with _$TbWhItem {
  factory TbWhItem({
    String? standard,
    String? qt,
    String? comps,
    int? length,
    String? warehouseNm,
    String? itemNo,
    String? itemNm,
    String? warehouseArea,
    String? warehouseCd,
    int? width,
    String? useYn,
    int? boxKg,
    int? height,
    int? rgstrId,
    int? updtrId,
  }) = _TbWhItem;

  factory TbWhItem.fromJson(Map<String, dynamic> json) => _$TbWhItemFromJson(json);
}

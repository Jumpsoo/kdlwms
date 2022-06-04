import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_wh_item.freezed.dart';

part 'tb_wh_item.g.dart';

@freezed
class TbWhItem with _$TbWhItem {
  factory TbWhItem({
    required String	ITEM_NM,
    String?	STANDARD,
    String?	QT,
    required String	ITEM_NO,
    int?	BOX_KG,
    int?	LENGTH,
    int?	WIDTH,
    int?	HEIGHT,
    String?	WAREHOUSE_CD,
    String?	WAREHOUSE_NM,
    String?	WAREHOUSE_AREA,
    String?	USE_YN,
    int?	RGSTR_ID,
    DateTime?	RGST_DT,
    int?	UPDTR_ID,
    DateTime?	UPDT_DT,


  }) = _TbWhItem;

  factory TbWhItem.fromJson(Map<String, dynamic> json) => _$TbWhItemFromJson(json);
}

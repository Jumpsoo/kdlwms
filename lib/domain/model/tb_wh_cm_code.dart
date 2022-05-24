import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_wh_cm_code.freezed.dart';

part 'tb_wh_cm_code.g.dart';

@freezed
class TbWhCmCode with _$TbWhCmCode {
  factory TbWhCmCode({
    int?	CODE_ID,
    String?	GRP_CD,
    String?	CODE_CD,
    String?	CODE_KO_NM,
    String?	CODE_EN_NM,
    String?	CODE_JA_NM,
    String?	REF_1,
    String?	REF_2,
    String?	REF_3,
    String?	REF_4,
    String?	REF_5,
    int?	CODE_ORDR,
    String?	USE_YN,
    int?	RGSTR_ID,
    DateTime?	RGST_DT,
    int?	UPDTR_ID,
    DateTime?	UPDT_DT,


  }) = _TbWhCmCode;

  factory TbWhCmCode.fromJson(Map<String, dynamic> json) => _$TbWhCmCodeFromJson(json);
}

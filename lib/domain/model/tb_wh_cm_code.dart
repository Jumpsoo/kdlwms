import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_wh_cm_code.freezed.dart';

part 'tb_wh_cm_code.g.dart';

@freezed
class TbWhCmCode with _$TbWhCmCode {
  factory TbWhCmCode({
    String? comps,
    int? codeId,
    String? grpCd,
    String? codeCd ,
    String? codeKoNm,
    String? codeEnNm,
    String? codeJaNm,
    String? ref1,
    String? ref2,
    String? ref3,
    String? ref4,
    String? ref5,
    int? codeOrdr ,
    String? useYn,
    int? rgstrId ,
    int? updtrId ,
  }) = _TbWhCmCode;

  factory TbWhCmCode.fromJson(Map<String, dynamic> json) => _$TbWhCmCodeFromJson(json);
}

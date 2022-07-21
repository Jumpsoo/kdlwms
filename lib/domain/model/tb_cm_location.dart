import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_cm_location.freezed.dart';
part 'tb_cm_location.g.dart';

@freezed
class TbCmLocation with _$TbCmLocation {
  factory TbCmLocation({
    required String  workshop    ,
    String?  workshopNm    ,
    required String  location    ,
    String? setFlag,
    DateTime? syncDateTime ,
    String?  cmf1           ,
    String?  cmf2           ,
    String?  cmf3           ,
    String?  cmf4           ,
    String?  cmf5
  }) = _TbCmLocation;

  factory TbCmLocation.fromJson(Map<String, dynamic> json) => _$TbCmLocationFromJson(json);
}

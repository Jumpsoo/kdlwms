import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_cm_location.freezed.dart';
part 'tb_cm_location.g.dart';

@freezed
class TbCmLocation with _$TbCmLocation {
  factory TbCmLocation({
    required String  WORKSHOP    ,
    String?  WORKSHOP_NM    ,
    required String  LOCATION    ,
    String? SET_FLAG,
    DateTime? SYNC_DATETIME ,
    String?  CMF_1           ,
    String?  CMF_2           ,
    String?  CMF_3           ,
    String?  CMF_4           ,
    String?  CMF_5
  }) = _TbCmLocation;

  factory TbCmLocation.fromJson(Map<String, dynamic> json) => _$TbCmLocationFromJson(json);
}

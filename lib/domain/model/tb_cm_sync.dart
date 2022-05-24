import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_cm_sync.freezed.dart';

part 'tb_cm_sync.g.dart';

@freezed
class TbCmSync with _$TbCmSync {
  factory TbCmSync({
    String?	VERSION_CODE,
    String?	VERSION_DESC,
    DateTime?	SYNC_DATETIME,
    String?	CMF_1,
    String?	CMF_2,
    String?	CMF_3,
    String?	CMF_4,
    String?	CMF_5,

  }) = _TbCmSync;

  factory TbCmSync.fromJson(Map<String, dynamic> json) => _$TbCmSyncFromJson(json);
}

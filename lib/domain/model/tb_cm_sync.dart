import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_cm_sync.freezed.dart';

part 'tb_cm_sync.g.dart';

@freezed
class TbCmSync with _$TbCmSync {
  factory TbCmSync({
    required String	versionCode,
    String?	versionDesc,
    DateTime?	syncDateTime,
    String?	cmf1,
    String?	cmf2,
    String?	cmf3,
    String?	cmf4,
    String?	cmf5,
  }) = _TbCmSync;

  factory TbCmSync.fromJson(Map<String, dynamic> json) => _$TbCmSyncFromJson(json);
}

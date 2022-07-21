import 'package:freezed_annotation/freezed_annotation.dart';

part 'tb_server_info.freezed.dart';
part 'tb_server_info.g.dart';

@freezed
class TbServerInfo with _$TbServerInfo {
  factory TbServerInfo({
    required String  serverUrl,
    String? comps,
    String? deviceId,
    int? vibrateState,
    int? scanAlwaysState,
  }) = _TbServerInfo;

  factory TbServerInfo.fromJson(Map<String, dynamic> json) => _$TbServerInfoFromJson(json);
}

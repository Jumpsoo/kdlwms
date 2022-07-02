import 'dart:convert';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_load.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

// http 통신을 위해 사용
class PalletApi {

  final http.Client client = http.Client();
  static final baseUrl = gServiceURL + '/update';

  PalletApi();

  //상차항목 전송
  Future<Result<List<TbWhPalletLoad>>> sendPalletLoadList(
      List<TbWhPalletLoad> palletList) async {
    try {
      if (palletList.isEmpty) {
        return const Result.error('전송할 데이터가 없습니다.');
      }

      List<TbWhPalletLoad> retList = [];
      var dataAsMap = jsonEncode(palletList.map((e) => e.toJson()).toList());

      http.Response res = await http.post(
        Uri.parse(baseUrl),
        body: dataAsMap,
        headers: {"Content-Type": "application/json"},
      );
      // res => List<TbWhPallet>
      // 생성된 apllet seq 업데이트
      try {
        if (res.statusCode == 200) {

          Map<String, dynamic> resData = convert
              .jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
          String retSeq = resData['data'].toString();
        } else {
          return Result.error('에러발생 : ${res.statusCode}');
        }
      } catch (e) {
        writeLog("sendPalletList 예외: ");
        writeLog(e);
      }
      return Result.success(retList);
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }
}

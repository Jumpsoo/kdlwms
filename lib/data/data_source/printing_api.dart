import 'dart:convert';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

// http 통신을 위해 사용
class PrintingApi {
  final http.Client client = http.Client();

  PrintingApi();

  static const baseUrl = 'http://54.180.96.240:8080/api/printTag';

  Future<Result<bool?>> sendPrintingList(
      List<TbWhPallet> palletList, int nState) async {

    if (palletList.isEmpty) {
      return const Result.error('전송 할 인쇄 데이터가 없습니다.');
    }
    
    var dataAsMap = jsonEncode(palletList.map((e) => e.toJson()).toList());
print(dataAsMap);
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

      } else {

        return Result.error('에러발생 : ${res.statusCode}');
      }
    } catch (e) {
      writeLog("sendPalletList 예외: ");
      writeLog(e);
    }
    return const Result.success(true);
  }
}

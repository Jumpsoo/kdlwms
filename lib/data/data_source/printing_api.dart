import 'dart:convert';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_load.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

// http 통신을 위해 사용
class PrintingApi {
  final http.Client client = http.Client();

  PrintingApi();

  static final baseUrl = gServiceURL + '/printTag';

  Future<Result<int?>> sendPrintingList(
      List<TbWhPallet> palletList) async {

    if (palletList.isEmpty) {
      return const Result.error('전송 할 인쇄 데이터가 없습니다.');
    }
    
    var dataAsMap = jsonEncode(palletList.map((e) => e.toJson()).toList());
    int nPalletSeq = 0;

    http.Response res = await http.post(
      Uri.parse(baseUrl),
      body: dataAsMap,
      headers: {"Content-Type": "application/json"},
    );
    try {
      if (res.statusCode == 200) {
        Map<String, dynamic> resData = convert
            .jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
        String retSeq = resData['data'].toString();
        nPalletSeq = int.parse(retSeq);
        return Result.success(nPalletSeq);

      } else {
        Map<String, dynamic> resData = convert
            .jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
        return Result.error('에러발생 : ${res.statusCode}');
      }
    } catch (e) {

      var sErrMsg = "처리중 에러발생 : sendPrintingList (api) ";
      writeLog(e.toString());
      return Result.error(sErrMsg);
    }
  }
}

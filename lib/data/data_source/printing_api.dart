import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

// http 통신을 위해 사용
class PrintingApi {
  final http.Client client = http.Client();

  PrintingApi();

  static final baseUrl = gServiceURL + '/printTag';

  Future<Result<int?>> sendPrintingList(
      List<TbWhPalletPrint> palletList) async {

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
writeLog(dataAsMap);

    try {
      if (res.statusCode == 200) {
        return Result.success(nPalletSeq);

      } else {
        return Result.error('에러발생 : ${res.statusCode}');
      }
    } catch (e) {

      var sErrMsg = "처리중 에러발생 : sendPrintingList (api) ";
      writeLog(e.toString());
      return Result.error(sErrMsg);
    }
  }
}

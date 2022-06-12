import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

// http 통신을 위해 사용
class PalletApi {
  final http.Client client = http.Client();

  PalletApi();

  static const baseUrl = 'http://54.180.96.240:8080/api/insertPallet';

  Future<Result<List<TbWhPallet>>> sendPalletList(List<TbWhPallet> palletList) async {
    try {
      if(palletList.isEmpty){
        return const Result.error('전송할 데이터가 없습니다.');
      }
      var dataAsMap = jsonEncode(palletList.map((e) => e.toJson()).toList());
      var dataToSend = jsonEncode(dataAsMap);

      writeLog(dataToSend);

      final response = await client.post(
        Uri.parse('$baseUrl'),
        headers: {"Content-Type": "application/json"},
        body: dataToSend,
      );

      writeLog(response.body);
      return Result.success(palletList.toList());
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }
}

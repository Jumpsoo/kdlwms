import 'dart:convert';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

// http 통신을 위해 사용
class PalletApi {
  final http.Client client = http.Client();

  PalletApi();

  static const baseUrl = 'http://54.180.96.240:8080/api/insertPallet';

  Future<Result<List<TbWhPallet>>> sendPalletList(
      List<TbWhPallet> palletList) async {
    try {
      if (palletList.isEmpty) {
        return const Result.error('전송할 데이터가 없습니다.');
      }
      List<TbWhPallet> retList = [];

      var dataAsMap = jsonEncode(palletList.map((e) => e.toJson()).toList());
      var dataToSend = jsonEncode(dataAsMap);

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
          int nPalletSeq = int.parse(retSeq);

          for(TbWhPallet item in palletList){
            retList.add(item.copyWith(palletSeq: nPalletSeq, state: LoadState.Confirm.index));
          }
        } else {
          return Result.error('에러발생 : ${res.statusCode}');
        }
      } catch (e) {
        writeLog("sendPalletList 예외: ");
        writeLog(e);
      }

      return Result.success(retList);

      //
      // final response = await client.post(
      //   Uri.parse('$baseUrl'),
      //   headers: {"Content-Type": "application/json"},
      //   body: dataToSend,
      // );

      // writeLog(response.body);
      return Result.success(palletList.toList());
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }
}

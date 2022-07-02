import 'dart:convert';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_load.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

// http 통신을 위해 사용
class PalletApi {
  final http.Client client = http.Client();

  PalletApi();

  // 적재항목 완료 시 전송
  Future<Result<List<TbWhPallet>>> sendPalletList(
      List<TbWhPallet> palletList) async {
    try {
      final callUrl = gServiceURL + '/insertPallet';
      if (palletList.isEmpty) {
        return const Result.error('전송할 데이터가 없습니다.');
      }

      //json 데이터 전송
      List<TbWhPallet> retList = [];
      var dataAsMap = jsonEncode(palletList.map((e) => e.toJson()).toList());

      http.Response res = await http.post(
        Uri.parse(callUrl),
        body: dataAsMap,
        headers: {"Content-Type": "application/json"},
      );
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

  // 상차항목 전송
  Future<Result<bool>> sendPalletLoadList(
      List<TbWhPalletPrint> palletList) async {
    try {
      final callUrl = gServiceURL + '/load';
      if (palletList.isEmpty) {
        return const Result.error('전송할 데이터가 없습니다.');
      }

      //데이터 변환 (post - json )
      var dataAsMap = jsonEncode(palletList.map((e) => e.toJson()).toList());

      writeLog(dataAsMap);

      //호출
      http.Response res = await http.post(
        Uri.parse(callUrl),
        body: dataAsMap,
        headers: {"Content-Type": "application/json"},
      );
      try {
        //성공인 경우
        writeLog(dataAsMap);
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
      return Result.success(true);
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }

  Future<Result<List<TbWhPallet>>> selectPalletListByApi(
      TbWhPallet tbWhPallet, String sPalletSeq) async {
    try {
      final callUrl = gServiceURL + '/pallet';

      //필수값
      String scanDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      String sComps = tbWhPallet.comps!;
      String sLocation = tbWhPallet.location!;
      String sWorkShop = tbWhPallet.workshop!;
      String sParameters = '';
      int nPalletSeq = int.parse(sPalletSeq);

      if (sPalletSeq.isNotEmpty) {
        //서버반여여후 아래 주석부분으로 교체할것
        sParameters = '$callUrl?comps=$gComps&palletSeq=$nPalletSeq&location=$sLocation&workShop=$sWorkShop&palletDate=$scanDate';
        // sParameters = '$callUrl?pallet_seq=$nPalletSeq&location=$sLocation&workShop=$sWorkShop&palletDate=$scanDate';
      } else {
        //서버반여여후 아래 주석부분으로 교체할것
        sParameters = '$callUrl?comps=$gComps&location=$sLocation&workShop=$sWorkShop&palletDate=$scanDate';
         //sParameters ='$callUrl?location=$sLocation&workShop=$sWorkShop&palletDate=$scanDate';
      }
      writeLog(sParameters);

      final res = await client.get(Uri.parse(sParameters));
      if (res.statusCode == 200) {
        Map<String, dynamic> resData = convert
            .jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;

        Map<String, dynamic> jsonResponse =
            jsonDecode(utf8.decode(res.bodyBytes));
        Iterable hits = jsonResponse['data']['palletList'];

        //리스트로 변환
        List<TbWhPallet> retList =
            hits.map((e) => TbWhPallet.fromJson(e)).toList();

        return Result.success(retList);
      }

    } catch (e) {
      writeLog(e.toString());
      return const Result.error('네트워크 연결 에러');
    }
    return Result.error(gErrorMsg);
  }

  //라벨발행 리스트 조회
  Future<Result<List<TbWhPalletPrint>>> selectPalletPrintingList(
      TbWhPallet tbWhPallet, String sPalletSeq) async {
    try {
      final callUrl = gServiceURL + '/selectTag';
      //필수값
      String scanDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      String sComps = tbWhPallet.comps!;
      String sLocation = tbWhPallet.location!;
      String sWorkShop = tbWhPallet.workshop!;
      String sParameters = '';
      int nPalletSeq = 0;

      if (sPalletSeq.isNotEmpty) {
        nPalletSeq = int.parse(sPalletSeq);
        sParameters =
        '$callUrl?comps=$gComps&palletSeq=$nPalletSeq&palletDate=$scanDate&location=$sLocation&workShop=$sWorkShop';
      }else{
        sParameters =
        '$callUrl?comps=$gComps&palletDate=$scanDate&location=$sLocation&workShop=$sWorkShop';

      }
      final res = await client.get(Uri.parse(sParameters));

      if (res.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            jsonDecode(utf8.decode(res.bodyBytes));
        Iterable hits = jsonResponse['data']['tagList'];

        List<TbWhPalletPrint> retList =
            hits.map((e) => TbWhPalletPrint.fromJson(e)).toList();

        return Result.success(retList);
      } else {
        return Result.error('서비스에러' + res.statusCode.toString());
      }
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }
}

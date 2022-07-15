import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

// http 통신을 위해 사용
class CmCodeRcvApi {
  final http.Client client = http.Client();

  static final baseUrl = gServiceURL + '/code';

  Future<Result<Iterable>> selectCmCodeListAll() async {
    try {

      final response = await client.get(
          Uri.parse('$baseUrl?comp=$gComps'));
      Map<String, dynamic> jsonResponse =
      jsonDecode(utf8.decode(response.bodyBytes));
      Iterable hits = jsonResponse['data']['codeList'];

      return Result.success(hits);
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }

  Future<Result<Iterable>> selectCmCodeListByCodeCd(
      TbWhCmCode tbWhCmCode) async {
    try {

      String sGrpCd = tbWhCmCode.grpCd!;
      String sCodeCd = tbWhCmCode.codeCd!;
      String sParameter = '$baseUrl?comps=$gComps&grpCd=$sGrpCd&codeCd=$sCodeCd';
      final response = await client.get(
          Uri.parse(sParameter));

      Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      Iterable hits = jsonResponse['data']['codeList'];

      return Result.success(hits);
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }

  Future<Result<Iterable>> selectCmCodeListByGrpCd(
      TbWhCmCode tbWhCmCode) async {
    try {
      String sGrpCd = tbWhCmCode.grpCd!;
      String sParameter = '$baseUrl?comps=$gComps&grpCd=$sGrpCd';
      final response =
          await client.get(Uri.parse(sParameter));

      Map<String, dynamic> jsonResponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      Iterable hits = jsonResponse['data']['codeList'];

      return Result.success(hits);
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }

  Future<Result<Iterable>> getPDAVersion() async {
    try {
      final response =
      await client.get(Uri.parse('$baseUrl?grpCd=PDA_VERSION'));

      Map<String, dynamic> jsonResponse =
      jsonDecode(utf8.decode(response.bodyBytes));
      Iterable hits = jsonResponse['data']['codeList'];

      return Result.success(hits);
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }
}

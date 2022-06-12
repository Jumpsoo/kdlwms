import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

// http 통신을 위해 사용
class CmCodeRcvApi {
  final http.Client client = http.Client();

  static const baseUrl = gServiceURL + '/cmCode';

  Future<Result<Iterable>> selectCmCodeList(String query) async {
    try {
      final response = await client
          // .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));
          .get(Uri.parse('$baseUrl'));

      Map<String, dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      Iterable hits = jsonResponse['data']['itemList'];

      return Result.success(hits);
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }

}

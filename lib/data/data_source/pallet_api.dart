import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kdlwms/data/data_source/result.dart';

class PalletApi {
  final http.Client client;

  PalletApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '10711147-dc41758b93b263957026bdadb';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client
          .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success(hits);
    } catch (e) {
      return const Result.error('네트워크 연결 에러');
    }
  }
}

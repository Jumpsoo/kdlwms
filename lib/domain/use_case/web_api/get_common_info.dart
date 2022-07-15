import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/repository/cm_code_rcv_repo_impl.dart';

class GetServerVersion {
  final CmCodeRcvRepoImpl repository;

  GetServerVersion(this.repository);

  Future<String> call() async {
    String sVersion = '';

    Result result = await repository.getPDAVersion();
    result.when(success: (value) {
      sVersion = value;
    }, error: (message) {
      return '동기화 실패';
    });

    return sVersion;
  }
}

import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/repository/tb_cm_sync_repo.dart';

class GetLastSyncInfo {
  final TbCmSyncRepo repository;

  GetLastSyncInfo(this.repository);

  Future<Result<TbCmSync?>> call () async {
    return await repository.getLastSyncInfo();
  }
}

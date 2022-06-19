import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/repository/tb_cm_sync_repo.dart';

class SaveLastSyncInfo {

  final TbCmSyncRepo repository;
  SaveLastSyncInfo(this.repository);

  Future<Result<bool?>> call(String pdaVersion) async {
    TbCmSync tbCmSync = TbCmSync(
      VERSION_CODE: pdaVersion,
      VERSION_DESC: pdaVersion,
      SYNC_DATETIME: DateTime.now(),
    );
    Result result = await repository.mergeTbCmSync(tbCmSync);
    result.when(success: (value){
      return Result.success(value);
    }, error: (message){
      return Result.error(message);
    });

    return const Result.success(true);
  }
}

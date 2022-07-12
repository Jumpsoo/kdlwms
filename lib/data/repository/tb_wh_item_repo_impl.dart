import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/data/data_source/tb_wh_item_db_helper.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/repository/tb_wh_item_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

class TbWhItemRepoImpl implements TbWhItemRepo {
  final TbWhItemDbHelper db;

  TbWhItemRepoImpl(this.db);

  @override
  Future<Result<List<TbWhItem>?>> getTbWhItemList() async {
    return await db.getTbWhItemList();
  }


  @override
  Future<Result<bool>> insertTbWhItem(TbWhItem tbWhItem) async {
    return await db.insertTbWhItem(tbWhItem);
  }

  @override
  Future<Result<bool>> deleteAndInsertTbWhItemBatch(List<TbWhItem> tbWhItems) async {

    Result result = await deleteTbWhItemAll();
    result.when(success: (value) async {
      int nOkCnt = 0;
      int nTotalCnt = tbWhItems.length;
      for (TbWhItem tbWhItem in tbWhItems) {
        Result resultInsert = await db.insertTbWhItem(tbWhItem);
        resultInsert.when(success: (value) {
        }, error: (message) {
          return Result.error(message);
        });
        nOkCnt = nOkCnt + 1;
      }
      writeLog('총 $nTotalCnt 건:  / 성공: $nOkCnt 건');

      return Result.success(value);
    }, error: (message) {
      return Result.error(message);
    });
    return const Result.success(true);
  }

  @override
  Future<Result<bool>> updateTbWhItem(TbWhItem tbWhItem) async {
    return await db.updateTbWhItem(tbWhItem);
  }

  @override
  Future<Result<bool>> deleteTbWhItem(TbWhItem tbWhItem) async {
    return await db.deleteTbWhItem(tbWhItem);
  }

  @override
  Future<Result<bool>> deleteTbWhItemAll() async {
    return await db.deleteTbWhItemAll();
  }

  @override
  Future<Result<TbWhItem?>> selectTbWhItem(TbWhItem tbWhItem) async {
    return await db.selectTbWhItem(tbWhItem);
  }
}

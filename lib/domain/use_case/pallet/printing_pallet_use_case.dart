import 'package:kdlwms/data/data_source/pallet_api.dart';
import 'package:kdlwms/data/data_source/printing_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

class PrintingPalletUseCase {
  PrintingApi api = PrintingApi();

  PrintingPalletUseCase();

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(List<TbWhPallet> palletList, int nState) async {

    Result result = await api.sendPrintingList(palletList, nState);
    result.when(success: (value) {}, error: (message) {
      return Result.error(message);
    });
    return const Result.success(true);
  }
}

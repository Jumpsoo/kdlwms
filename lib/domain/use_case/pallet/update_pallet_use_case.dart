import 'package:kdlwms/data/data_source/pallet_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_load.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_load_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

class UpdatePalletUseCase {
  final TbWhPalletRepo repository;

  UpdatePalletUseCase(this.repository);

  Future<void> call(List<TbWhPallet> pallets) async {
    await repository.updateTbWhPallet(pallets);
  }
}

//완료처리
class ConfirmPalletFinishUseCase {
  final TbWhPalletRepo repository;
  PalletApi api = PalletApi();

  ConfirmPalletFinishUseCase(this.repository);

  // 변경 후 서버전송
  Future<Result<bool>> call(List<TbWhPallet> palletList) async {

    //팔레트 전송
    Result result = await api.sendPalletList(palletList);
    result.when(success: (value) async {      //전송이 성공했을때 데이터 클리어
      Result resultUpd = await repository.deleteTbWhPallet(palletList);
      resultUpd.when(success: (value){}, error: (message){
        return Result.error(message);
      });
    }, error: (message) {
      return Result.error(message);
    });

    return const Result.success(true);
  }
}

//상차처리
class LoadingPalletFinishUseCase {
  final TbWhPalletLoadRepo repository;
  PalletApi api = PalletApi();

  LoadingPalletFinishUseCase(this.repository);

  // 변경 후 서버전송
  Future<Result<bool>> call(
      List<TbWhPalletPrint> palletList) async {

    Result result = await api.sendPalletLoadList(palletList);
    result.when(
        success: (savedList) {},
        error: (message) {
          return Result.error(message);
        });

    //전송이 성공한 경우 업데이트
    // Result resultUpd = await repository.deleteTbWhPalletLoad(palletList);
    // resultUpd.when(
    //     success: (value) {},
    //     error: (message) {
    //       return Result.error(message);
    //     });

    return const Result.success(true);
  }
}

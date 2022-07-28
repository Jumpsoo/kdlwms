import 'package:kdlwms/data/data_source/pallet_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_load_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

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

  // 변경 후 서버전송 - 완료처리
  Future<Result<bool>> call(List<TbWhPallet> palletList) async {

    String sMsg = '';
    bool bRet = false;

    Result result = await api.sendPalletList(palletList);
    //전송이 성공했을때 데이터 클리어
    result.when(success: (value) async {
      bRet = true;

    }, error: (message) {
      bRet = false;
      sMsg = message;
    });

    if(bRet) {
      Result resultUpd = await repository.deleteTbWhPallet(palletList);
      resultUpd.when(success: (value) async {
        print(">>>>>>>>>>>>>>>>>>>>>>> deleteTbWhPallet 1");
        print(value);

        bRet = true;
      }, error: (message) {
        bRet = false;
        sMsg = message;
      });
    }
    if (bRet) {
      return Result.success(bRet);
    } else {
      return Result.error(sMsg);
    }
  }
}

//상차처리
class LoadingPalletFinishUseCase {
  final TbWhPalletLoadRepo repository;
  PalletApi api = PalletApi();

  LoadingPalletFinishUseCase(this.repository);

  // 변경 후 서버전송
  Future<Result<bool>> call(List<TbWhPalletPrint> palletList) async {
    String sMsg = '';
    bool bRet = false;

    Result result = await api.sendPalletLoadList(palletList);
    result.when(success: (savedList) {
      bRet = true;
    }, error: (message) {
      bRet = false;
      sMsg = message;
    });

    if (bRet) {
      return const Result.success(true);
    } else {
      return Result.error(sMsg);
    }
  }
}

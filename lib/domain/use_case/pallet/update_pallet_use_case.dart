
import 'package:kdlwms/data/data_source/pallet_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

class UpdatePalletUseCase{
  final TbWhPalletRepo repository;

  UpdatePalletUseCase(this.repository);

  Future<void> call (List<TbWhPallet> pallets) async {
    await repository.updateTbWhPallet(pallets);
  }
}

//완료처리
class UpdatePalletFinishUseCase{
  final TbWhPalletRepo repository;
  PalletApi api = PalletApi();

  UpdatePalletFinishUseCase(this.repository);
   // 변경 후 서버전송
  Future<Result<bool>> call(List<TbWhPallet> pallets) async {

    Result<List<TbWhPallet>> result = await api.sendPalletList(pallets);
    result.when(success: (savedList) async{
      //전송이 성공한 경우 업데이트
      Result resultUpd = await repository.updateTbWhPalletState(savedList);
      resultUpd.when(success: (value){}, error: (message){
        return Result.error(message);
      });
    }, error: (message){
      return Result.error(message);
    });
    return const Result.success(true);
  }
}
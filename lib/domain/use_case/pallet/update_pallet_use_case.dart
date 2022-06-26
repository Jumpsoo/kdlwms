
import 'package:kdlwms/data/data_source/pallet_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';

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
  Future<Result<bool>> call(List<TbWhPallet> pallets,  int nState) async {
    List<TbWhPallet> targetList = [];

    //데이터 조회 후 전송
    for(TbWhPallet item in pallets) {
      Result result = await repository.selectTbWhPalletInto(item);
      result.when(success: (selectedItem){
        targetList.add(selectedItem!);
      }, error: (message){
      });
    }

    Result result = await api.sendPalletList(targetList, nState);
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
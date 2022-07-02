import 'dart:convert';

import 'package:kdlwms/data/data_source/printing_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_load.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_load_repo.dart';
import 'package:kdlwms/domain/repository/tb_wh_pallet_repo.dart';

// 인쇄요청(-> 벡엔드에서 실제 팔레트를 생성해서 인쇄 모둘까지 전송한다.
// 전송 완료 후 ok 응답받으면 상차테이블로 전송하고 삭제
class PrintingPalletUseCase {
  PrintingApi api = PrintingApi();
  final TbWhPalletLoadRepo repository;
  final TbWhPalletRepo repositoryPallet;

  PrintingPalletUseCase(this.repository, this.repositoryPallet);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<Result<bool>> call(List<TbWhPallet> palletLists) async {

    Result result = await api.sendPrintingList(palletLists);

    result.when(success: (value) async {
      //처리 완료되면 : 상차테이블로 복사
      //대상 삭제
      // List<TbWhPalletLoad> migList = value;

      //테스트용 삭제할것
      List<TbWhPalletLoad> migList = [];
      for (TbWhPallet item in palletLists) {
        TbWhPalletLoad newItem = TbWhPalletLoad(
          comps: item.comps,
          // 팔레트번호 업데이트 후 상차테이블로 넘길것
          palletSeq: value,
          workshop: item.workshop,
          location: item.location,
          itemNo: item.itemNo,
          itemLot: item.itemLot,
          quantity: item.quantity,
          state: item.state,
          barcode: item.barcode,
          scanDate: item.scanDate,
          scanUsernm: item.scanUsernm,
          boxNo: item.boxNo,
          printFlag: item.printFlag,
          printDate: item.printDate,
          printUser: item.printUser,
          as400IfFlag: item.as400IfFlag,
          as400IfDate: item.as400IfDate,
          as400IfUser: item.as400IfUser,
          rgstrId: item.rgstrId,
          rgstDt: item.rgstDt,
          updtrId: item.updtrId,
          updtDt: item.updtDt,
        );
        migList.add(newItem);
      }

      Result resultMig = await repository.upsertTbWhPalletLoad(migList);
      resultMig.when(success: (value) async {

        //최종내역 삭제
        Result resultDel = await repositoryPallet.deleteTbWhPallet(palletLists);
        resultDel.when(success: (value){

          return Result.success(true);
        }, error: (message){
          return Result.error(message);
        });
      }, error: (message) {
        return Result.error(message);
      });
    }, error: (message) async {
      return Result.error(message);
    });
    return const Result.success(true);
  }
}

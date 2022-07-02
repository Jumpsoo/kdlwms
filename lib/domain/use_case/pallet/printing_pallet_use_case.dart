import 'dart:convert';

import 'package:kdlwms/data/data_source/printing_api.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_load.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';
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
  Future<Result<bool>> call(List<TbWhPalletPrint> palletLists) async {

    Result result = await api.sendPrintingList(palletLists);
    result.when(success: (value) async {

    }, error: (message) async {
      return Result.error(message);
    });
    return const Result.success(true);
  }
}

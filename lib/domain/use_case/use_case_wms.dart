import 'package:kdlwms/domain/use_case/pallet/insert_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/printing_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/select_master_info.dart';
import 'package:kdlwms/domain/use_case/pallet/update_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/delete_pallet_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/select_pallets_use_case.dart';
import 'package:kdlwms/domain/use_case/pallet/scan_qr_code.dart';

class UseCaseWms {
  final InsertPalletUseCase addPallet;
  final UpdatePalletUseCase updatePallet;

  // 서버로 전송 및 로컬디비 데이터 수정
  // 2022-07-01 | 서버로 전송하지 않고, 상태만 변경한다.
  // 2022-07-02 | 서버롤 전송하고 전송한 데이터는 삭제한다.
  final ConfirmPalletFinishUseCase confirmPalletFinishUseCase;
  //상차처리 : 서버전송 후 로컬디비 테이블 복사 후 해당 데이터 삭제
  final LoadingPalletFinishUseCase loadingPalletFinishUseCase;
  final DeletePalletUseCase deletePallet;
  final DeletePalletAllUseCase deletePalletAllUseCase;
  final DeletePalletLoadAllUseCase deletePalletLoadAllUseCase;

  //01. 실적처리 화면 쿼리
  // packing 중인것과 상차된것 구분해서처리
  // 상차된항목은 packing 중인항목에 조회되면 안됨
  final SelectPackingListUseCase selectPackingListUseCase;
  final SelectPackingSummaryUseCase selectPackingSummaryUseCase;

  //02. 실적조회 화면 쿼리
  final SelectPalletingListUseCase selectPalletingListUseCase;
  final SelectPalletingSummaryUseCase selectPalletingSummaryUseCase;

  //03. 라벨링 화면 쿼리
  final SelectPrintingList selectPrintingList;

  //04.상차화면 관련 조회 쿼리
  final SelectLoadingListUseCase selectLoadingListUseCase;
  final SelectLoadingListByApiUseCase selectLoadingListByApiUseCase;
  final SelectLoadingSummaryUseCase selectLoadingSummaryUseCase;
  final GetPalletLoadCountInDevice getPalletLoadCountInDevice;


  final GetPalletCountInDevice getPalletCountInDevice;

  // 인쇄요청(-> 벡엔드에서 실제 팔레트를 생성해서 인쇄 모둘까지 전송한다.
  // 전송 완료 후 ok 응답받으면 상차테이블로 전송하고 삭제
  final SelectCheckValue selectCheckValue;

  final ScanQrCode scanQrCode;

  final SelectItemList selectItemList;

  // 인쇄요청(-> 벡엔드에서 실제 팔레트를 생성해서 인쇄 모둘까지 전송한다.
  // 전송 완료 후 ok 응답받으면 상차테이블로 전송하고 삭제
  final PrintingPalletUseCase printingPalletUseCase;

  UseCaseWms({
    required this.addPallet,
    required this.updatePallet,
    required this.loadingPalletFinishUseCase,
    required this.deletePallet,
    required this.deletePalletAllUseCase,
    required this.selectPackingListUseCase,
    required this.getPalletCountInDevice,
    required this.selectCheckValue,
    required this.scanQrCode,
    required this.selectPackingSummaryUseCase,
    required this.selectLoadingSummaryUseCase,
    required this.selectLoadingListUseCase,
    required this.selectItemList,
    required this.selectPrintingList,
    required this.printingPalletUseCase,
    required this.selectPalletingListUseCase,
    required this.selectPalletingSummaryUseCase,
    required this.confirmPalletFinishUseCase,
    required this.getPalletLoadCountInDevice,
    required this.deletePalletLoadAllUseCase,
    required this.selectLoadingListByApiUseCase,
  });
}

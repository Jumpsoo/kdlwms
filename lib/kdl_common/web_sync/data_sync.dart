import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/kdl_common/web_sync/data_sync_viewmodel.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class DataSync extends StatefulWidget {
  const DataSync({Key? key}) : super(key: key);

  @override
  State<DataSync> createState() => _DataSyncState();
}

class _DataSyncState extends State<DataSync> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<bool> syncData( bool ignoreMsg) async {
  const double nTotalPercent = 100;
  const double nIncreaseUnit = 100 / 4;
  double percentage = 0.0;
  String sBatchName = '공통코드';
  String sServerVersion = '';

  DataSyncViewModel dataSyncViewModel = gTransitContext.read<DataSyncViewModel>();
  //실적조회용 : 차후 삭제할것
  PalletViewModel palletViewModel = gTransitContext.read<PalletViewModel>();
  SettingInfoViewModel viewModelSettings = gTransitContext.read<SettingInfoViewModel>();

  //00. 프로그램 버전 체크
  //로컬버전
  gCurrentVersion = await viewModelSettings.useCaseCommonInfo
      .getCurrentLocalVersion('PDA_VERSION');
  //서버버전
  sServerVersion = await dataSyncViewModel.useCaseDataBatch.getServerVersion();
  writeLog('로컬버전 / 서버버전 : $gCurrentVersion / $sServerVersion');

  gCurrentVersion = sServerVersion;
  
  if(ignoreMsg == true && gCurrentVersion == sServerVersion){
    //동기화 하지 않음
    if(await checkSyncStatusNoAlert() == true) {
      return false;
    }
  }

  ProgressDialog progressDialog = ProgressDialog(
    gTransitContext,
    type: ProgressDialogType.Download,
    textDirection: TextDirection.ltr,
    isDismissible: true,
  );

  progressDialog.style(
//      message: 'Downloading file...',
    message: '초기화 중 ..',
    borderRadius: 10.0,
    backgroundColor: Colors.white,
    elevation: 10.0,
    insetAnimCurve: Curves.easeInOut,
    progress: 0.0,
    progressWidgetAlignment: Alignment.center,
    maxProgress: 100.0,
    progressTextStyle: const TextStyle(
        color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    messageTextStyle: const TextStyle(
        color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
  );
  await progressDialog.show();


  sBatchName = '01.공통 코드';
  writeLog('$sBatchName');
  TbWhCmCode condTbWhCmCode = TbWhCmCode();
  if (await _getBatchItem(
    gTransitContext,
        sBatchName,
        await dataSyncViewModel.useCaseDataBatch
            .migTbWhCmCode(condTbWhCmCode, sBatchName),
        progressDialog,
        percentage,
      ) ==
      false) {
    return false;
  } // 01.공통코드 완료

  await Future.delayed(Duration(milliseconds: 500), () {});

  sBatchName = '02.품목정보';
  writeLog('$sBatchName');
  //조건이있을 경우 추가 할 것
  TbWhItem condTbWhItem = TbWhItem();
  percentage = percentage + nIncreaseUnit;
  if (await _getBatchItem(
    gTransitContext,
        sBatchName,
        await dataSyncViewModel.useCaseDataBatch.migTbWhItem(condTbWhItem),
        progressDialog,
        percentage,
      ) ==
      false) {
    return false;
  }

  Result resultItem = await palletViewModel.useCasesWms.selectItemList();
  writeLog(resultItem);
  resultItem.when(success: (itemList) {}, error: (messge) {});

  await Future.delayed(Duration(milliseconds: 500), () {});

  sBatchName = '03.작업장정보&팔레트정보';
  writeLog('$sBatchName');
  percentage = percentage + nIncreaseUnit;
  if (await _getBatchItem(
    gTransitContext,
        sBatchName,
        await dataSyncViewModel.useCaseDataBatch.migTbCmLocation(),
        progressDialog,
        percentage,
      ) ==
      false) {
    return false;
  }
  //
  await Future.delayed(Duration(milliseconds: 500), () {});

  sBatchName = '04.버전정보 동기화중..';
  //로컬버전정보 -> 서버로 변경
  Result resultVersion = await dataSyncViewModel.useCaseDataBatch.updateLocalVersion(sServerVersion) ;
  resultVersion.when(success: (value) async {
    await dataSyncViewModel.useCaseDataBatch.saveLastSyncInfo(sServerVersion);
    gSync = await checkSyncStatus(gTransitContext);
  }, error: (message){});

  //로컬 데이터 갱신일자 저장
  // writeLog('$sBatchName');
  // percentage = percentage + nIncreaseUnit;
  // if (await _getBatchItem(
  //   context,
  //   sBatchName,
  //   await viewModel.useCaseDataBatch.getCurrentVersionRow(),
  //   progressDialog,
  //   percentage,
  // ) ==
  //     false) {
  //   _exitInitialProgram();
  //
  // }


  progressDialog.hide();


  return true;
}

//인터페이스 실패시 강제 종료
void _exitInitialProgram() {
  if (Platform.isIOS) {
    exit(0);
  } else {
    // SystemNavigator.pop();
    writeLog('종료됨: 구현후 주석해제할것');
  }
}

void updateProgressBar(
    ProgressDialog progressDialog, double dCurrentPercent, String sMsg) {
  progressDialog.update(
    progress: dCurrentPercent,
    message: '$sMsg',
    progressWidget: Container(
        padding: const EdgeInsets.all(8.0),
        child: const CircularProgressIndicator()),
    maxProgress: 100.0,
    progressTextStyle: const TextStyle(
        color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),
    messageTextStyle: const TextStyle(
        color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
  );
}

//### 02. 품목정보 리스트
Future<bool> _getBatchItem(BuildContext context, String sBatchName,
    Result result, ProgressDialog progressDialog, double percentage) async {
  int delayTime = 1000;
  bool retVal = false;
  writeLog('$sBatchName : 시작');
  DataSyncViewModel viewModel = context.read<DataSyncViewModel>();

  try {
    result.when(success: (value) async {
      updateProgressBar(progressDialog, percentage, '[$sBatchName].. 내려받는 중');
      writeLog('$sBatchName : 성공');
      retVal = true;
    }, error: (message) async {
      await showAlertDialog(context, message);
      await showAlertDialog(context, '동기화 실패로 종료됩니다. 시스템 관리자에게 문의하세요.');
      progressDialog.hide();
      writeLog('$sBatchName : 오류 [$message]');
      retVal = false;
      //실패시 프로그램 강제 종료
      WidgetsBinding.instance.addPostFrameCallback((_) => _exitInitialProgram);
    });
  } catch (e) {
    writeLog('$sBatchName : 오류 + [$e]');
    retVal = false;
  }
  return retVal;
}

Future<void> probeResult(Result resultFrom) async {}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/kdl_common/batch/data_sync_viewmodel.dart';
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

Future<bool> syncData(BuildContext context, bool ignoreMsg) async {
  const double nTotalPercent = 100;
  const double nIncreaseUnit = 100/4;
  double percentage = 0.0;
  String sBatchName = '공통코드';

  DataSyncViewModel viewModel = context.read<DataSyncViewModel>();

  //실적조회용 : 차후 삭제할것
  PalletViewModel palletViewModel = context.read<PalletViewModel>();
  SettingWorkshopViewModel viewModelshop = context.read<SettingWorkshopViewModel>();

  if (ignoreMsg == false) {
    if (await showAlertDialogQ(
          context,
          '확인',
          '전체 정보를 새로 받으시겠습니까?',
        ) ==
        false) {
      return false;
    }
  }

  ProgressDialog progressDialog = ProgressDialog(
    context,
    type: ProgressDialogType.Download,
    textDirection: TextDirection.ltr,
    isDismissible: true,
//      customBody: LinearProgressIndicator(
//        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
//        backgroundColor: Colors.white,
//      ),
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
        context,
        sBatchName,
        await viewModel.useCaseDataBatch
            .migTbWhCmCode(condTbWhCmCode, sBatchName),
        progressDialog,
        percentage,
      ) ==
      false) {
    return false;
  } // 01.공통코드 완료

  progressDialog.hide();

  sBatchName = '02.품목정보';
  writeLog('$sBatchName');
  //조건이있을 경우 추가 할 것
  TbWhItem condTbWhItem = TbWhItem();
  percentage = percentage + nIncreaseUnit;
  if (await _getBatchItem(
        context,
        sBatchName,
        await viewModel.useCaseDataBatch.migTbWhItem(condTbWhItem),
        progressDialog,
        percentage,
      ) ==
      false) {
    return false;
  }

  Result resultItem = await palletViewModel.useCasesWms.selectItemList();
  writeLog(resultItem);
  resultItem.when(success: (itemList){
    print(itemList);
  }, error: (messge){});

  sBatchName = '03.작업장정보&팔레트정보';
  writeLog('$sBatchName');
  percentage = percentage + nIncreaseUnit;
  if (await _getBatchItem(
        context,
        sBatchName,
        await viewModel.useCaseDataBatch.migTbCmLocation(),
        progressDialog,
        percentage,
      ) ==
    false) {
    return false;
  }



  // sBatchName = '04.버전정보 동기화중..';
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
void _exitInitialProgram(){
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
        padding: const EdgeInsets.all(8.0), child: const CircularProgressIndicator()),
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
  int delayTime = 500;
  bool retVal = false;
  writeLog('$sBatchName : 시작');
  DataSyncViewModel viewModel = context.read<DataSyncViewModel>();

  try {
    result.when(success: (value)  async {
      updateProgressBar(progressDialog, percentage, '[$sBatchName].. 내려받는 중');
      Future.delayed(Duration(milliseconds: delayTime), () {});
      writeLog('$sBatchName : 성공');
      retVal =  true;
    }, error: (message) {
      showAlertDialog(context, message);
      showAlertDialog(context, '동기화 실패로 종료됩니다. 시스템 관리자에게 문의하세요.');
      progressDialog.hide();
      writeLog('$sBatchName : 오류 [$message]');
      retVal = false;
      //실패시 프로그램 강제 종료
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _exitInitialProgram);
    });
  } catch (e) {
    writeLog('$sBatchName : 오류 + [$e]');
    retVal = false;
  }
  return retVal;
}

Future<void> probeResult(Result resultFrom) async {}


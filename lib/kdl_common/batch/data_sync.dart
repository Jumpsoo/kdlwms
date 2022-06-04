import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/kdl_common/batch/data_sync_viewmodel.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
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

Future<bool> syncData(BuildContext context) async {
  double percentage = 0.0;
  String sBatchName = '공통코드';
  int delayTime = 500;

  DataSyncViewModel viewModel = context.read<DataSyncViewModel>();

  if (await showAlertDialogQ(
        context,
        '확인',
        '전체 중요정보를 \r\n 새로 받으시겠습니까?',
      ) ==
      false) {
    return false;
  }

  ProgressDialog progressDialog = ProgressDialog(
    context,
    type: ProgressDialogType.Download,
    textDirection: TextDirection.rtl,
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
    messageTextStyle: TextStyle(
        color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
  );

  await progressDialog.show();

  //### 01. 공통코드 리스트 처리
  sBatchName = '공통 코드';
  Result result = await viewModel.useCaseDataBatch.migTbWhCmCode(
    getTbWhCmCodeList(),
    sBatchName,
  );
  await result.when(success: (value) async {
    percentage = percentage + 20.0;
    updateProgressBar(progressDialog, percentage, '[$sBatchName].. 내려받는 중');
    await Future.delayed(Duration(milliseconds: delayTime), () {});
  }, error: (message) async {
    await showAlertDialog(context, message);
    progressDialog.hide();
    return false;
  });

  //### 02. 품목정보 리스트
  sBatchName = '품목 정보';
  result = await viewModel.useCaseDataBatch.migTbWhItem(
    getTbWhItemList(),
  );
  await result.when(success: (value) async {
    percentage = percentage + 20.0;
    updateProgressBar(progressDialog, percentage, '[$sBatchName].. 내려받는 중');
    await Future.delayed(Duration(milliseconds: delayTime), () {});
  }, error: (message) async {
    await showAlertDialog(context, message);
    progressDialog.hide();
    return false;
  });

  // 03. 작업장 정보 리스트
  sBatchName = '작업장정보';
  result = await viewModel.useCaseDataBatch.migTbCmLocation(
    getTbCmLocationList(),
  );
  await result.when(success: (value) async {
    percentage = percentage + 20.0;
    updateProgressBar(progressDialog, percentage, '[$sBatchName].. 내려받는 중');
    await Future.delayed(Duration(milliseconds: delayTime), () {});
  }, error: (message) async {
    await showAlertDialog(context, message);
    progressDialog.hide();
    return false;
  });

  // 04. 동기화 정보 리스트
  sBatchName = '버전 정보';
  result = await viewModel.useCaseDataBatch.migTbCmSync(
    getTbCmSyncList(),
  );
  await result.when(success: (value) async {
    percentage = percentage + 20.0;
    updateProgressBar(progressDialog, percentage, '[$sBatchName].. 내려받는 중');
    await Future.delayed(Duration(milliseconds: delayTime), () {});
  }, error: (message) async {
    await showAlertDialog(context, message);
    progressDialog.hide();
    return false;
  });

  percentage = percentage + 20.0;
  updateProgressBar(progressDialog, percentage, '정리 중..');
  await Future.delayed(Duration(milliseconds: delayTime), () {});

  if (percentage >= 100.0) {
    progressDialog.hide();
  }
  return true;
}

void updateProgressBar(
    ProgressDialog progressDialog, double dCurrentPercent, String sMsg) {
  progressDialog.update(
    progress: dCurrentPercent,
    message: "$sMsg",
    progressWidget: Container(
        padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
    maxProgress: 100.0,
    progressTextStyle: TextStyle(
        color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),
    messageTextStyle: TextStyle(
        color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
  );
}

Future<void> probeResult(Result resultFrom) async {

}

//▼ import 용 데이터 정비
// 01. 공통코드 리스트
List<TbWhCmCode> getTbWhCmCodeList() {
  List<TbWhCmCode> retList = [];
  TbWhCmCode item = TbWhCmCode(
      CODE_ID: 1,
      GRP_CD: 'GRP_CD',
      CODE_CD: 'CODE_CD',
      CODE_KO_NM: 'CODE_KO_NM',
      CODE_EN_NM: 'CODE_EN_NM',
      CODE_JA_NM: 'CODE_JA_NM',
      REF_1: 'REF_1',
      REF_2: 'REF_2',
      REF_3: 'REF_3',
      REF_4: 'REF_4',
      REF_5: 'REF_5',
      CODE_ORDR: 2,
      USE_YN: 'Y',
      RGSTR_ID: 9999,
      RGST_DT: null,
      UPDTR_ID: 9999,
      UPDT_DT: null);
  retList.add(item);
  return retList;
}

// 02. 품목정보 리스트
List<TbWhItem> getTbWhItemList() {
  List<TbWhItem> retList = [];
  TbWhItem item = TbWhItem(
      ITEM_NM: 'ITEM_NM',
      STANDARD: 'STANDARD',
      QT: 'QT',
      ITEM_NO: 'ITEM_NO',
      BOX_KG: 15,
      LENGTH: 90,
      WIDTH: 200,
      HEIGHT: 100,
      WAREHOUSE_CD: 'WAREHOUSE_CD',
      WAREHOUSE_NM: 'WAREHOUSE_NM',
      WAREHOUSE_AREA: 'WAREHOUSE_AREA',
      USE_YN: 'Y',
      RGSTR_ID: 999,
      RGST_DT: null,
      UPDTR_ID: 999,
      UPDT_DT: null);

  retList.add(item);
  return retList;
}

// 03. 작업장 정보 리스트
List<TbCmLocation> getTbCmLocationList() {

  List<TbCmLocation> retList = [];

  TbCmLocation item = TbCmLocation(
    WORKSHOP: 'WORK001',
    WORKSHOP_NM: 'WORKSHOP#4',
    LOCATION: '001',
    SYNC_DATETIME: DateTime.now(),
    SET_FLAG: 'N',
    CMF_1: ' ',
    CMF_2: ' ',
    CMF_3: ' ',
    CMF_4: ' ',
    CMF_5: ' ',
  );
  TbCmLocation item1 = TbCmLocation(
    WORKSHOP: 'WORK002',
    WORKSHOP_NM: 'WORKSHOP#5',
    LOCATION: '002',
    SYNC_DATETIME: DateTime.now(),
    SET_FLAG: 'N',
    CMF_1: ' ',
    CMF_2: ' ',
    CMF_3: ' ',
    CMF_4: ' ',
    CMF_5: ' ',
  );
  TbCmLocation item2 = TbCmLocation(
    WORKSHOP: 'WORK003',
    WORKSHOP_NM: 'WORKSHOP#6',
    LOCATION: '003',
    SYNC_DATETIME: DateTime.now(),
    SET_FLAG: 'N',
    CMF_1: ' ',
    CMF_2: ' ',
    CMF_3: ' ',
    CMF_4: ' ',
    CMF_5: ' ',
  );

  retList.add(item);
  retList.add(item1);
  retList.add(item2);

  return retList;
}

// 04. 동기화 정보 리스트
List<TbCmSync> getTbCmSyncList() {
  List<TbCmSync> retList = [];
  TbCmSync item = TbCmSync(
    VERSION_CODE: 'VERSION_CODE',
    VERSION_DESC: 'VERSION_DESC',
    SYNC_DATETIME: null,
    CMF_1: 'CMF_1',
    CMF_2: 'CMF_2',
    CMF_3: 'CMF_3',
    CMF_4: 'CMF_4',
    CMF_5: 'CMF_5',
  );
  retList.add(item);
  return retList;
}

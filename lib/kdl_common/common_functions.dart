import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/kdl_common/web_sync/data_sync_viewmodel.dart';
import 'package:pointmobile_scanner/pointmobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:http/http.dart' as http;
import 'package:vibration/vibration.dart';

late BuildContext dialogContext;

/// 사용자 확인 다이얼로그
Future<bool> showAlertDialogQ(
    BuildContext context, String sTitle, String sMsg) async {
  return await showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(sTitle),
        content: Text(sMsg),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('확인'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          ElevatedButton(
            child: const Text('취소'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      );
    },
  );
}

///알림용 다이얼로그
Future<void> showAlertDialog(BuildContext context, String sMsg) async {
  await showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('알림'),
        content: Text(sMsg),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('확인'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      );
    },
  );
}

Future<void> showSuccessMsg(BuildContext context) async {
  await showAlertDialog(context, '성공적으로 처리되었습니다.');
}

Future<void> showErrorMsg(BuildContext context, String sErrorLocation) async {
  await showAlertDialog(
      context, '처리중 오류가 발생했습니다. 다시 시도해 주세요.' + sErrorLocation);
}

//경고일 경우 팝업도 보여주고 하단 스낵바도 보여준다.
// 에러일 경우에는 스캐너 종료
void showCustomSnackBarWarn(BuildContext context, String message) async {
  ScaffoldMessenger.of(context).clearSnackBars();

  //진동
  if (gVibrateEnable == 0) {
    Vibration.vibrate(duration: 1000);
  }
  //오류소리
  playNgSound();
  //스캐너 비활성화
  if(gScanAlwaysOn == 1) {

     setOffAutoScanner();
  }

  final snackBar1 = SnackBar(
    backgroundColor: Colors.red,
    content: Text(message),
    action: SnackBarAction(
      textColor: Colors.yellow,
      label: '닫기',
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar1);
  WidgetsBinding.instance.addPostFrameCallback((_) =>setOffOnScanner());
  // setOffOnScanner();

  WidgetsBinding.instance.addPostFrameCallback(
        (_) => setOffOnScanner(),
  );
}

void showCustomSnackBarSuccess(
    BuildContext context, String message, bool bPlaySound) {
  ScaffoldMessenger.of(context).clearSnackBars();

  if (bPlaySound) {
    playOkSound();
  }
  final snackBar1 = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      textColor: Colors.white,
      label: '닫기',
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar1);
}

showCircularProgressIndicator(BuildContext context) {
  String sMessage = '처리중';
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      dialogContext = context;
      return Dialog(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            Text(sMessage),
          ],
        ),
      );
    },
  );
}

hideCircularProgressIndicator() {
  Navigator.pop(dialogContext);
}

//종료
exitProgram(BuildContext context) async {
  if (await showAlertDialogQ(context, '', '종료하시겠습니까?') == true) {
    exit(0);
  }
}

//향후 로그저장필요시 상세 구현할것
void writeLog(var msg) {
  if (kDebugMode) {
    print(msg);
  }
}

//동기화 일자체크 ( 화면용)
Future<bool> checkSyncStatus(BuildContext context) async {
  DataSyncViewModel dataSyncViewModel =
      gTransitContext.read<DataSyncViewModel>();

  Result resultSyncStatus =
      await dataSyncViewModel.useCaseDataBatch.getLastSyncInfo();
  resultSyncStatus.when(success: (value) {
    TbCmSync tbCmSync = value;

    String localSyncDate = tbCmSync.syncDateTime!.month.toString() +
        tbCmSync.syncDateTime!.day.toString();
    DateTime currDate = DateTime.now();
    String currentDate = currDate.month.toString() + currDate.day.toString();

    if (localSyncDate == currentDate) {
      gSync = true;
    } else {
      gSync = false;
    }
  }, error: (message) {
    gSync = false;
  });
  if (!gSync) {
    await showAlertDialog(context, "서버와 동기와 필요. \r\n 프로그램을 다시 실행하세요.");
    await Future.delayed(const Duration(milliseconds: 2000));
    Restart.restartApp();
  }
  return gSync;
}

//동기화 일자체크
Future<bool> checkSyncStatusNoAlert() async {
  DataSyncViewModel dataSyncViewModel =
      gTransitContext.read<DataSyncViewModel>();
  Result resultSyncStatus =
      await dataSyncViewModel.useCaseDataBatch.getLastSyncInfo();
  resultSyncStatus.when(success: (value) {
    TbCmSync tbCmSync = value;
    String localSyncDate = tbCmSync.syncDateTime!.month.toString() +
        tbCmSync.syncDateTime!.day.toString();
    DateTime currDate = DateTime.now();
    String currentDate = currDate.month.toString() + currDate.day.toString();

    if (localSyncDate == currentDate) {
      gSync = true;
    } else {
      gSync = false;
    }
  }, error: (message) {
    gSync = false;
  });
  return gSync;
}

//인터넷 접속 어뎁터 확인
Future<bool> tryConnectionWithPopup(BuildContext context) async {
  String errMsg = '인터넷 연결을 찾을 수 없습니다. \r\n';

  if (await tryConnection() == false) {
    await showAlertDialog(context, errMsg);
    return false;
  } else {
    return true;
  }
}

//인터넷 접속 어뎁터 확인
Future<bool> tryConnection() async {
  final ConnectivityResult result = await Connectivity().checkConnectivity();

  try {
    if (result == ConnectivityResult.wifi) {
      final response =
          await http.head(Uri.parse(gServiceURL + '/item?itemNo=x'));
      if (response.statusCode != 200) {
        return false;
      }
      return true;
    } else if (result == ConnectivityResult.mobile) {
      final response =
          await http.head(Uri.parse(gServiceURL + '/item?itemNo=x'));
      if (response.statusCode != 200) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  } catch (_) {
    return false;
  }
}

void playScanOkSound() async {
  await audioPlayerOk.open(Audio('assets/ok.wav'));
  await audioPlayerOk.play();
}

void playOkSound() async {
  //await audioPlayerOk.open(Audio('assets/ok.wav'));
  await audioPlayerOk.open(Audio('assets/ding1.mp3'));
  await audioPlayerOk.play();
}

void playNgSound() async {
  await audioPlayerNG.open(Audio('assets/siren.mp3'));
  await audioPlayerNG.play();
}

void setOffAutoScanner() async {
  PointmobileScanner.disableScanner();

}

void setOffOnScanner() async {
  await Future.delayed(const Duration(milliseconds: 1000), () async {
    PointmobileScanner.enableScanner();
  });
}

var bodyProgress = Container(
  child: new Stack(
    children: <Widget>[
      Container(
        alignment: AlignmentDirectional.center,
        decoration: new BoxDecoration(
          color: Colors.white70,
        ),
        child: new Container(
          decoration: new BoxDecoration(
              color: Colors.blue[200],
              borderRadius: new BorderRadius.circular(10.0)),
          width: 300.0,
          height: 200.0,
          alignment: AlignmentDirectional.center,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child: new SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: new CircularProgressIndicator(
                    value: null,
                    strokeWidth: 7.0,
                  ),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: new Center(
                  child: new Text(
                    "loading.. wait...",
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

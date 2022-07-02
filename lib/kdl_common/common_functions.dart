import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_sync.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/kdl_common/web_sync/data_sync_viewmodel.dart';
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

Future<void> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Confirm Title'),
        content: Text('bora hihi'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('CANCEL'),
            onPressed: () {},
          ),
          ElevatedButton(
            child: Text('ACCEPT'),
            onPressed: () {},
          )
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
void showCustomSnackBarWarn(BuildContext context, String message) async {
  ScaffoldMessenger.of(context).clearSnackBars();

  //진동
  if (gVibrateEnable == 0) {
    Vibration.vibrate(duration: 400);
  }

  final snackBar1 = SnackBar(
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
}

void showCustomSnackBarSuccess(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();

  FlutterBeep.beep();

  if (gVibrateEnable == 0) {
    Vibration.vibrate(duration: 100);
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
  f (kDebugMode) {
    print(msg);
  }
}

Future<bool> checkSyncStatus(BuildContext context) async {
  DataSyncViewModel dataSyncViewModel =
      gTransitContext.read<DataSyncViewModel>();
  Result resultSyncStatus =
      await dataSyncViewModel.useCaseDataBatch.getLastSyncInfo();
  resultSyncStatus.when(success: (value) {
    TbCmSync tbCmSync = value;
    String localSyncDate = tbCmSync.SYNC_DATETIME!.month.toString() +
        tbCmSync.SYNC_DATETIME!.day.toString();
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
    // Restart.restartApp();
  }
  return gSync;
}

Future<bool> checkSyncStatusNoAlert() async {
  DataSyncViewModel dataSyncViewModel =
      gTransitContext.read<DataSyncViewModel>();
  Result resultSyncStatus =
      await dataSyncViewModel.useCaseDataBatch.getLastSyncInfo();
  resultSyncStatus.when(success: (value) {
    TbCmSync tbCmSync = value;
    String localSyncDate = tbCmSync.SYNC_DATETIME!.month.toString() +
        tbCmSync.SYNC_DATETIME!.day.toString();
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

Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  var map = <T, List<S>>{};
  for (var element in values) {
    (map[key(element)] ??= []).add(element);
  }
  return map;
}

Map<K, V> mergeMaps<K, V>(Map<K, V> map1, Map<K, V> map2,
    {V Function(V, V)? value}) {
  var result = Map<K, V>.of(map1);
  if (value == null) return result..addAll(map2);

  map2.forEach((key, mapValue) {
    result[key] =
        result.containsKey(key) ? value(result[key] as V, mapValue) : mapValue;
  });
  return result;
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
      print('other type network');
      return false;
    }
  } catch (_) {
    print('에러');
    return false;
  }

}

class GlobalNavigator {
  static showAlertDialog(String text) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('AAAAA'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

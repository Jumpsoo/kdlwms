import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beep/flutter_beep.dart';

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
Future<void> showCustomSnackBarWarn(
    BuildContext context, String message) async {

  showAlertDialog(context, message);

  final snackBar1 = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      textColor: Colors.yellow,
      label: '닫기',
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar1);
}

Future<void> showCustomSnackBarSuccess(
    BuildContext context, String message) async {

  ScaffoldMessenger.of(context).clearSnackBars();

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
  return  showDialog(
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
exitProgram(BuildContext context) async{
  if(await showAlertDialogQ(context, '', '종료하시겠습니까?') == true){
    SystemNavigator.pop();
  }
}

//향후 로그저장필요시 상세 구현할것
void writeLog(var msg){
  print(msg);
}

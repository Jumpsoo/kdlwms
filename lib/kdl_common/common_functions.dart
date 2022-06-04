import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';

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

Future<void> showCustomSnackBarWarn(
    BuildContext context, String message) async {

  final snackBar1 = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      textColor: Colors.yellow,
      label: '',
      onPressed: () {
        //
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar1);
}

Future<void> showCustomSnackBarSuccess(
    BuildContext context, String message) async {
  final snackBar1 = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      textColor: Colors.white,
      label: '',
      onPressed: () {
        //
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar1);
}

import 'package:flutter/material.dart';

/// 사용자 확인 다이얼로그
Future<bool> showAlertDialogQ(BuildContext context, String sTitle, String sMsg) async {
  await showDialog(
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
  return true;
}

///알림용 다이얼로그
Future<void> showAlertDialog(BuildContext context,String sMsg) async {
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


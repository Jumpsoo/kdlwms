import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/web_sync/data_sync.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/presentation/settings/setting_property.dart';

class MainFrameNavigationBarMain extends StatelessWidget {
  MainFrameNavigationBarMain({Key? key}) : super(key: key);

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900],
        unselectedItemColor: Colors.white,
        unselectedFontSize: 18,
        selectedFontSize: 18,
        onTap: (index) => {
              if (index == 0)
                {
                  //주요정보 새로받기
                  //받은 후 화면 갱신
                  //화면 갱신하면서 버전정보 수정
                  // 버전정보 최신화가 안되면 강제 종료 "정보 초기화 실패"
                  //loadSyncDataPage(context),
                  _syncData(context),
                }
              else if (index == 1)
                {
                  _moveToSetting(context),
                }
              else if (index == 2)
                {
                  exitProgram(context),
                }
            },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.update,
              color: Colors.white,
            ),
            label: '정보 받기',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 25,
            ),
            label: '환경 설정',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.highlight_off,
              color: Colors.white,
              size: 25,
            ),
            label: '종료',
          ),
        ]);
  }

  void _moveToSetting(BuildContext context) async {
    showCircularProgressIndicator(context);
    await Future.delayed(const Duration(milliseconds: 500));

    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SettingProperty(title: '환경 설정')),
    );
  }

  void _syncData(BuildContext context) async {
    //인터넷 접속 확인
    if (await tryConnectionWithPopup(context) == false) {
      return;
    }

    if (await showAlertDialogQ(
          context,
          '확인',
          '전체 정보를 새로 받으시겠습니까?',
        ) ==
        true) {
      syncData(false);
    }
  }
}

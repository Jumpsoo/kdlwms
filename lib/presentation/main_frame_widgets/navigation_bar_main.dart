import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/kdl_common/batch/data_sync.dart';

class MainFrameNavigationBarMain extends StatelessWidget {
  const MainFrameNavigationBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
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
                    syncData(context),

                  }
                else if (index == 1)
                  {
                    Future.delayed(const Duration(seconds: 1), () async {
                      SystemNavigator.pop();
                    }),
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
                Icons.highlight_off,
                color: Colors.white,
                size: 25,
              ),
              label: '종료',
            ),
          ]),
    );
  }
}

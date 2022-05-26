import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/kdl_common/batch/data_sync.dart';
import 'package:kdlwms/kdl_common/batch/data_sync_page.dart';

class MainFrameNavigationBarMain extends StatelessWidget {
  const MainFrameNavigationBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
          backgroundColor: Colors.blueGrey[900],
          unselectedItemColor: Colors.white,
          onTap: (index) => {
                if (index == 0)
                  {}
                else if (index == 1)
                  {
                    //모든 데이터를 지우고 다시내려받습니다. 계속 진행하시겠습니까/
                    // 유스케이스 작성
                    // 배치 Repogitory 분리 개발 (download)
                    // 대상항목 ( 품번, 창고,
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DataSyncPage(title: '데이터 동기화')),
                    ),
                  }
                else if (index == 2)
                  {
                    Future.delayed(const Duration(seconds: 1), () async {
                      SystemNavigator.pop();
                    }),
                  }
              },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              label: '설정',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: '정보 내려받기',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.highlight_off,
                color: Colors.white,
              ),
              label: '종료',
            )
          ]),
    );
  }
}

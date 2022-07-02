import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/pallet_work_frame.dart';
import 'package:restart_app/restart_app.dart';

class BtnMovePacking extends StatelessWidget  {
  const BtnMovePacking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sNo = '1';
    var sTitle = '팔레팅 작업';
    var sSubTitle = '완제품의 바코드를 읽혀주세요.';

    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: gWidthButtonLarge,
          height: gHeightButtonLarge,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(style: BorderStyle.solid, width: 2),
          ),
          child: ElevatedButton(
            onPressed: () async {
              //서버 동기화 체크
              await checkSyncStatus(context);

              //인터넷 접속 확인
              // if(await tryConnectionWithPopup(context) == false){
              //   return;
              // }

              showCircularProgressIndicator(context);
              await Future.delayed(const Duration(milliseconds: 500));

              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const PltWorkPage(title: '팔레팅 작업(실적 입력)')),
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(gWidthButtonLarge, gHeightButtonLarge),
              primary: Colors.teal[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 40,
                  child: Text(
                    sNo,
                    style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: "Roboto"),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 230,
                  height: 100,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            sTitle,
                            style: const TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            sSubTitle,
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            '(리딩 후 저장 필수)',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

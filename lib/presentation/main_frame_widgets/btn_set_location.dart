import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_page.dart';

class BtnSetLocation extends StatelessWidget {
  const BtnSetLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sNo = '2';
    var sTitle = '작업장 입력';
    var sSubTitle = '상차 작업장을 설정합니다.(신규/변경)';

    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: gWidthButtonLarge,
          height: gHeightButtonLarge,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.indigoAccent[200],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: Colors.indigoAccent, style: BorderStyle.solid, width: 2),
          ),
          child: ElevatedButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 1));
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingWorkShopPage(
                          title: '작업장 설정',
                        )),
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(gWidthButtonLarge, gHeightButtonLarge),
              primary: Colors.indigoAccent[200],
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
                            ' ',
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

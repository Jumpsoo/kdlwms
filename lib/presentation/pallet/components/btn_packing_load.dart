import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

import 'package:kdlwms/presentation/pallet/scan/pallet_load_page.dart';

class BtnPackingLoad extends StatelessWidget {
  const BtnPackingLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String sNo = '4';
    const String sTitle = '상차 완료';
    const String sChildTitle = '팔레팅 작업(상차 완료)';
    const String sSubTitle = '팔레팅 완료한 제품을 상차처리합니다.';

    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            //서버 동기화 체크
            await checkSyncStatus(context);

            showCircularProgressIndicator(context);
            await Future.delayed(const Duration(milliseconds: 500));

            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const PalletLoadPage(title: sChildTitle)),
            );
          },
          style: gElevatedButtonStyleMidSize,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0, right: 10),
                child: AutoSizeText(
                  sNo,
                  style: TextStyle(
                    fontSize: gFontSizeButtonTitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: AutoSizeText(
                        sTitle,
                        style: TextStyle(
                          fontSize: gFontSizeButtonTitle,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 3),
                      child: AutoSizeText(
                        sSubTitle,
                        style: TextStyle(
                            fontSize: gFontSizeButtonSubTitle,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

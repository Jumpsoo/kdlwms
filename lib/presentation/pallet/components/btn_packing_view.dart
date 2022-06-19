import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_view_page.dart';

class BtnPackingView extends StatelessWidget {
  const BtnPackingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String sNo = '3';
    const String sTitle = '실적 조회';
    const String sChildTitle = '팔레팅 작업(실적 조회)';
    const String sSubTitle = '팔레팅 처리 내역을 확인합니다.';

    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            //서버 동기화 체크
            await checkSyncStatus(context);

            showCircularProgressIndicator(context);
            // await Future.delayed(const Duration(seconds: 1));
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const PalletViewPage(title: sChildTitle)),
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

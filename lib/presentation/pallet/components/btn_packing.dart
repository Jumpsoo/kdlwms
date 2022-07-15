import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_scan_page.dart';

class BtnPacking extends StatelessWidget {
  const BtnPacking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String sNo = '1';
    const String sTitle = '적재 작업';
    const String sSubTitle = '완제품의 바코드를 읽어 팔레팅 진행';
    const String sChildTitle = '팔레팅 작업(실적 입력)';

    
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
                builder: (context) => const PalletScanPage(title: sChildTitle)
              ),
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

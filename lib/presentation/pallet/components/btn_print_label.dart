import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/printing/printing_labels.dart';

class BtnPrintLabel extends StatelessWidget {
  const BtnPrintLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sNo = '2';
    var sTitle = '라벨 발행';
    var sSubTitle = '입력한 실적으로 원격 프린터 인쇄 ';

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
                  PrintingLabels(title: sTitle)),
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

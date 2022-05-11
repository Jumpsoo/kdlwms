import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

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
          onPressed: () async {},
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

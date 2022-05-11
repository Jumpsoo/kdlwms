import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class BtnPackingView extends StatelessWidget {
  const BtnPackingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sNo = '3';
    var sTitle = '실적 조회';
    var sSubTitle = '팔레팅 처리 내역을 확인합니다.';

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

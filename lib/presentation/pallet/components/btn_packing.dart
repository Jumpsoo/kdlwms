import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/di/provider_wms_setup.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_scan_page.dart';

class BtnPacking extends StatelessWidget {
  const BtnPacking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sNo = '1';
    var sTitle = '적재 작업';
    var sSubTitle = '완제품의 바코드를 읽어 팔레팅 진행';

    final providers = getWmsProviders();
    
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            await Future.delayed(const Duration(seconds: 1));
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PalletScanPage(title: "팔레팅 작업(실적입력)")
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

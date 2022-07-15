import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:provider/provider.dart';

// 기존소스벡업
class BakBtnPackingDelete extends StatefulWidget {
  const BakBtnPackingDelete({Key? key}) : super(key: key);

  @override
  State<BakBtnPackingDelete> createState() => _BakBtnPackingDelete();
}

class _BakBtnPackingDelete extends State<BakBtnPackingDelete> {
  late PalletViewModel viewModel;

  @override
  Widget build(BuildContext context) {

    const String sNo = '5';
    const String sTitle = '적재이력 삭제';
    const String sSubTitle = '미완료 상차 실적을 삭제합니다.';
    viewModel = context.watch<PalletViewModel>();

    return Column(
      children: [
        ElevatedButton(
          // 값 유무 체크 후 삭제
          // 값이 없을 경우 에러 메시지 출력
          onPressed: () async {
            //서버 동기화 체크
            await checkSyncStatus(context);

            if (await checkValue('DELETE', context)) {
              showCircularProgressIndicator(context);
              await Future.delayed(const Duration(milliseconds: 500));

              Result result =
                  await viewModel.useCasesWms.deletePalletAllUseCase();
              result.when(
                  success: (value) {},
                  error: (message) {
                    showCustomSnackBarWarn(context, message);
                    return;
                  });
              //상차이력 삭제

              Result resultLoad =
                  await viewModel.useCasesWms.deletePalletLoadAllUseCase();
              resultLoad.when(
                  success: (value) {},
                  error: (message) {
                    showCustomSnackBarWarn(context, message);
                    return;
                  });
              showCustomSnackBarWarn(context, gSuccessMsg);
              hideCircularProgressIndicator();
            }
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

  //체크로직, 완료, 삭제 시
  Future<bool> checkValue(String confirm, BuildContext ownContext) async {
    switch (confirm) {
      case 'DELETE':
        int nCount = await viewModel.useCasesWms.getPalletCountInDevice();
        Result result =
            await viewModel.useCasesWms.getPalletLoadCountInDevice();

        result.when(
            success: (itemCount) async {
              int loadCount = itemCount;
              nCount = nCount + loadCount;
            },
            error: (message) {});

        if (nCount == 0) {
          await showAlertDialog(ownContext, '삭제 할 데이터가 없습니다.');
          return false;
        }
        //데이터 건수 확인
        if (await showAlertDialogQ(
              ownContext,
              '확인',
              '($nCount) 건 자료를 삭제 하시겠습니까?',
            ) ==
            false) {
          return false;
        }
        break;
    }
    return true;
  }
}

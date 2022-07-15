library my_prj.globals;

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

int gSystemUserId = 11111;
String gDeviceId = "TEST001";
String gComps = 'C1';

String gSuccessMsg = '처리완료(OK!)';
String gErrorMsg = '에러 발생(NG!!)';

String gCurrentVersion = '동기화전 입니다.';
String gCheckInternet = '';
bool gSync = false;

int gVibrateEnable = 0;

// 사외
String gServiceURL = 'http://54.180.96.240:8080/api';
// 사내(덴소)
//String gServiceURL = 'http://10.73.254.208/api';

late AssetsAudioPlayer audioPlayerOk;
late AssetsAudioPlayer audioPlayerNG;
bool gbTriggerOn = false;

late BuildContext gTransitContext;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

String gSplitCharacter = '\r\n';

bool isLoggedIn = false;
double gMarginButtonNormal = 10.0;
double gPaddingButtonNormal = 5.0;

double gMarginButtonMax = 30.0;
double gPaddingButtonMax = 15.0;

//중간메뉴버튼ㄴ
double gWidthButtonNormal = 320;
double gHeightButtonNormal = 70;

double gWidthButtonSmall = 100;
double gHeightButtonSmall = 25;

double gWidthButtonLarge = 320;
double gHeightButtonLarge = 120;

double gFontSizeButtonTitle = 30;
double gFontSizeButtonSubTitle = 14;

String gblCompanyLogoText = 'DENSO';

//QR 코드 크기 체크
int gAvailableQrLength = 100;

const TextStyle textStyleButtonWhite18 = TextStyle(
    fontSize: 18.0,
    color: Color(0xFFFFFFFF),
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto");

const TextStyle textStyleButtonWhite11 =
    TextStyle(fontSize: 11.0, color: Color(0xFFFFFFFF), fontFamily: "Roboto");

dynamic gElevatedButtonStyleMidSize = ElevatedButton.styleFrom(
  fixedSize: Size(gWidthButtonLarge, gHeightButtonNormal),
  primary: Colors.teal[300],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);

dynamic gElevatedButtonStyleSmallSize = ElevatedButton.styleFrom(
  fixedSize: const Size(120, 40),
  primary: Colors.teal[300],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);

//상태, 1:적재, 2:적재확인, 3:상차, 4:도착완료
enum LoadState { None, Pack, Confirm, Load, Arrive }

class ComboValueType {
  final String key;
  final String value;

  ComboValueType({required this.key, required this.value});
}






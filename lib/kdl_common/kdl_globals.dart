library my_prj.globals;

import 'package:flutter/material.dart';

int gSystemUserId = 11111;
String gDeviceName = "TEST001";

bool isLoggedIn = false;
double gMarginButtonNormal = 10.0;
double gPaddingButtonNormal = 5.0;

double gMarginButtonMax = 30.0;
double gPaddingButtonMax = 15.0;

//중간메뉴버튼ㄴ
double gWidthButtonNormal = 320;
double gHeightButtonNormal = 80;

double gWidthButtonSmall = 100;
double gHeightButtonSmall = 25;

double gWidthButtonLarge = 320;
double gHeightButtonLarge = 120;

double gFontSizeButtonTitle = 30;
double gFontSizeButtonSubTitle = 14;

String gblCompanyLogoText = 'DENSO';

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

//상태
enum LoadState { None, Pack, Confirm, Load, Arrive }

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class SettingProperty extends StatefulWidget {
  final String title;

  const SettingProperty({Key? key, required this.title}) : super(key: key);

  @override
  State<SettingProperty> createState() => _SettingPropertyState();
}

class _SettingPropertyState extends State<SettingProperty> {
  final TextEditingController _textFieldControllerServerUrl =
      TextEditingController();
  final TextEditingController _textFieldControllerDeviceId =
      TextEditingController();

  int _nVibrateState = 0;
  int _nScanAlwaysOn = 0;

  @override
  // init에는 watch 사용 금지
  void initState() {
    super.initState();

    hideCircularProgressIndicator();

    _textFieldControllerServerUrl.text = gServiceURL;
    _textFieldControllerDeviceId.text = gDeviceId;

    _nVibrateState = gVibrateEnable;
    _nScanAlwaysOn = gScanAlwaysOn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                    primary: Colors.teal[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const AutoSizeText(
                    '서버주소(URL)',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  autofocus: false,
                  controller: _textFieldControllerServerUrl,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'http://',
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 4.0, top: 4.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                    primary: Colors.teal[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const AutoSizeText(
                    '장치 ID',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  autofocus: false,
                  controller: _textFieldControllerDeviceId,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '',
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                    primary: Colors.teal[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const AutoSizeText(
                    '진동모드',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                alignment: Alignment.centerLeft,
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 0,
                              groupValue: _nVibrateState,
                              onChanged: (int? index) {
                                setState(() {
                                  _nVibrateState = index!;
                                });
                                Vibration.vibrate(duration: 200);
                              }),
                          const Expanded(
                            child: Text('진동'),
                          )
                        ],
                      ),
                      //flex: _nVibrateState,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: _nVibrateState,
                              onChanged: (int? index) {
                                setState(() {
                                  _nVibrateState = index!;
                                });
                                Vibration.vibrate(duration: 50);
                              }),
                          const Expanded(
                            child: Text('무진동'),
                          )
                        ],
                      ),
                      //  flex: 1,
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                    primary: Colors.teal[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const AutoSizeText(
                    '스캔모드',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                alignment: Alignment.centerLeft,
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 0,
                              groupValue: _nScanAlwaysOn,
                              onChanged: (int? index) {
                                setState(() {
                                  _nScanAlwaysOn = index!;
                                });
                              }),
                          const Expanded(
                            child: Text('수동'),
                          )
                        ],
                      ),
                      //flex: _nVibrateState,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: _nScanAlwaysOn,
                              onChanged: (int? index) {
                                setState(() {
                                  _nScanAlwaysOn = index!;
                                });
                              }),
                          const Expanded(
                            child: Text('자동'),
                          )
                        ],
                      ),
                      //  flex: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueGrey[900],
            unselectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.check), label: '저장'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_back), label: '전화면')
            ],
            onTap: (index) => {
                  if (index == 0)
                    {
                      _setUrl(context),
                    } //완료, 완료처리및 서벚전송
                  else if (index == 1)
                    {
                      Future.delayed(const Duration(seconds: 1), () async {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        Navigator.pop(context);
                      })
                    }
                }));
  }

  //입력값 변수 저장 및 디비에 설정함
  void _setUrl(BuildContext context) async {
    if (_textFieldControllerServerUrl.text.trim() == '') {
      await showAlertDialog(context, '서버주소를 입력하세요.');
      return;
    }
    if (Uri.parse(gServiceURL).isAbsolute == false) {
      await showAlertDialog(context, '유효한 주소가 아닙니다. (http://*');
      return;
    }
    //데이터 건수 확인
    if (await showAlertDialogQ(
          context,
          '확인',
          '변경한 설정을 저장하시겠습니까?',
        ) ==
        false) {
      return;
    }

    gServiceURL = _textFieldControllerServerUrl.text;
    gDeviceId = _textFieldControllerDeviceId.text;
    gVibrateEnable = _nVibrateState;
    gScanAlwaysOn = _nScanAlwaysOn;

    print('gVibrateEnable : $gVibrateEnable');
    _saveServerProperty(
        context, gServiceURL, gDeviceId, gVibrateEnable, gScanAlwaysOn);
  }

  //
  void _saveServerProperty(BuildContext context, String sUrl, String sDeviceId,
      int nVibrateEnable, int nScanAlwaysOn) async {
    SettingInfoViewModel viewModelSetting;
    viewModelSetting = context.read<SettingInfoViewModel>();

    Result result = await viewModelSetting.useCaseServerInfo
        .mergeTbServerInfo(sUrl, sDeviceId, nVibrateEnable, nScanAlwaysOn);
    result.when(
        success: (value) {
          showCustomSnackBarSuccess(
            context,
            '저장 완료(OK)',
            true,
          );
        },
        error: (message) {});
  }
}

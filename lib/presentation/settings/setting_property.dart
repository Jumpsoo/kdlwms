import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
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

  String? _selectedCompsValue;
  List<ComboValueType> compsDataList = [];


  @override
  // init에는 watch 사용 금지
  void initState() {
    super.initState();

    hideCircularProgressIndicator();

    _textFieldControllerServerUrl.text = gServiceURL;
    _textFieldControllerDeviceId.text = gDeviceId;
    _selectedCompsValue = gComps;

    _nVibrateState = gVibrateEnable;
    _nScanAlwaysOn = gScanAlwaysOn;

    //사업장 콤보박스 데이터 조회
    setCompsList();
  }

  //최초로딩시 콤보박스 세팅
  //데이터가 없는 경우 하단 알람 창에 메세지 전시
  Future<void> setCompsList() async {

    List<ComboValueType> comboList = await getCompsComboValueList(context);


    setState(() {
      compsDataList = comboList;
      _selectedCompsValue = gComps;
    });
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
              const EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 60),
                    primary: Colors.teal[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const AutoSizeText(
                    '서버주소(URL)',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Roboto"),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Container(
                alignment: Alignment.centerLeft,
                width: 400,
                height: 50,
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
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 60),
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
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 195,
                      height: 50,
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
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 60),
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
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 195,
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
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 60),
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
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 195,
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

              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 60),
                        primary: Colors.teal[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const AutoSizeText(
                        '공장(사업장)',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 195,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            alignment: Alignment.centerRight,
                            child: createCompsDropDownButton(
                              compsDataList,
                            ),
                          ),
                        ],
                      ),
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
                      _setEnviroments(context),
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
  void _setEnviroments(BuildContext context) async {
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

    print(" _selectedCompsValue >> $_selectedCompsValue ");
    gServiceURL = _textFieldControllerServerUrl.text;
    gDeviceId = _textFieldControllerDeviceId.text;
    gComps = _selectedCompsValue!;
    gVibrateEnable = _nVibrateState;
    gScanAlwaysOn = _nScanAlwaysOn;


    _saveServerProperty(
        context, gServiceURL, gDeviceId, gComps, gVibrateEnable, gScanAlwaysOn);
  }

  //
  void _saveServerProperty(BuildContext context, String sUrl, String sDeviceId, String sComps,
      int nVibrateEnable, int nScanAlwaysOn) async {
    SettingInfoViewModel viewModelSetting;
    viewModelSetting = context.read<SettingInfoViewModel>();

    print(" >> _saveServerProperty ");
    Result result = await viewModelSetting.useCaseServerInfo
        .mergeTbServerInfoUseCase(sUrl, sDeviceId, sComps, nVibrateEnable, nScanAlwaysOn);

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

  // 사업장 콤보박스
  Widget createCompsDropDownButton(List<ComboValueType> compsList) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white60,
          border: Border.all(
              color: Colors.black12, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              iconSize: 30,
              elevation: 16,
              value: _selectedCompsValue ?? "",
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedCompsValue = newValue;
                  });
                }
              },
              selectedItemBuilder: (BuildContext context) {
                return compsList.map<Widget>((ComboValueType item) {
                  return Text(item.value);
                }).toList();
              },
              items: compsList.map((ComboValueType item) {
                return DropdownMenuItem<String>(
                  value: item.key,
                  child: Text(item.value),
                );
              }).toList(),
              hint: const Text('-선택-'),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<ComboValueType>> getCompsComboValueList(
      BuildContext context) async {
    SettingInfoViewModel viewModel = context.read<SettingInfoViewModel>();
    viewModel = context.read<SettingInfoViewModel>();
    //전체리스트 조회
    Result? result =
    await viewModel.useCaseCommonInfo.selectTbWhCmCodeListByGrpCd('FACTORY');
    List<ComboValueType> comboItemList = [];

    result.when(
        success: (c) {
          for (TbWhCmCode tb in c) {
            ComboValueType item = ComboValueType(
                key: tb.codeCd!, value: tb.codeCd! + ':' + (tb.ref1 == null ? '' : tb.ref1!));
            comboItemList.add(item);
          }
        },
        error: (message) {});

    //빈값 추가
    comboItemList.add(ComboValueType(key: '', value: '선택'));
    return comboItemList;
  }

  // Future<List<ComboValueType>> getDefaultCompsValue(
  //     BuildContext context) async {
  //   SettingInfoViewModel viewModel = context.read<SettingInfoViewModel>();
  //   viewModel = context.read<SettingInfoViewModel>();
  //   //전체리스트 조회
  //   TbWhCmCode  _tbWhCmCode = TbWhCmCode();
  //
  //   // Result? result =
  //   // await viewModel.useCaseCommonInfo.selectTbWhCmCodeListByCodeCd('FACTORY');
  //   List<ComboValueType> comboItemList = [];
  //
  //   result.when(
  //       success: (c) {
  //         for (TbWhCmCode tb in c) {
  //           ComboValueType item = ComboValueType(
  //               key: tb.codeCd!, value: tb.codeCd! + ':' + (tb.ref1 == null ? '' : tb.ref1!));
  //           comboItemList.add(item);
  //         }
  //       },
  //       error: (message) {});
  //
  //   //빈값 추가
  //   comboItemList.add(ComboValueType(key: '', value: '선택'));
  //   return comboItemList;
  // }

}

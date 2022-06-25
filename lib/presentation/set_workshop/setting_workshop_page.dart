import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/kdl_common/web_sync/data_sync.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_common_function.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:provider/provider.dart';

class SettingWorkShopPage extends StatefulWidget {
  final String title;

  const SettingWorkShopPage({Key? key, required this.title}) : super(key: key);

  @override
  State<SettingWorkShopPage> createState() => _SettingWorkShopPageState();
}

class _SettingWorkShopPageState extends State<SettingWorkShopPage> {
  String _msgData = '';
  List<ComboValueType> _datas = [];
  late BuildContext ownContext;
  late SettingInfoViewModel viewModel;
  List<TbCmLocation>? locationList = [];
  String sCurrentWorkShop = '';
  StreamSubscription? _subscription;

  String? _selectedValue;

  // 상태 메세지 변경
  void _setMsg(String sMsg) {
    setState(() {
      _msgData = sMsg;
    });
  }

  @override
  // init에는 watch 사용 금지
  void initState() {
    super.initState();

    setLocationList();

    hideCircularProgressIndicator();

    checkSyncStatus(context);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  //최초로딩시 콤보박스 세팅
  //데이터가 없는 경우 하단 알람 창에 메세지 전시
  Future<void> setLocationList() async {
    List<ComboValueType> comboList =
        await getWorkshopComboValueList(context);
    String? sDefaultLocation = await palletCommonGetDefaultWorkShop(context);
    setState(() {
      _datas = comboList;
      _selectedValue = sDefaultLocation;
    });
  }

  ///전역 작업장 설정
  void setDefaultWorkshop(String sSelectedWorkSHop) async {
    if (sSelectedWorkSHop.isEmpty == true) {
      // const snackBar1 = SnackBar(content: Text('먼저 작업장을 선택하세요.'));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar1);

      showCustomSnackBarWarn(context, '먼저 작업장을 선택하세요.');
      return;
    }
    if (await showAlertDialogQ(
          context,
          '확인',
          '선택한 정보로 설정하시겠습니까?',
        ) ==
        false) {
      return;
    }
    //선택 한 workshop 지정
    viewModel = context.read<SettingInfoViewModel>();
    Result? result = await viewModel.useCaseCommonInfo
        .updateFromSelectTbCmLocationToEnable(sSelectedWorkSHop);

    result.when(success: (value) {
      showCustomSnackBarSuccess(context, '성공');
      setLocationList();
    }, error: (message) {
      showCustomSnackBarWarn(context, message);
    });
  }

  Widget createWorkshopDropDownButton(List<ComboValueType> workshopList) {
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
              iconSize: 20,
              elevation: 16,
              value: _selectedValue ?? "",
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                }
              },
              selectedItemBuilder: (BuildContext context) {
                return workshopList.map<Widget>((ComboValueType item) {
                  return Text(item.value);
                }).toList();
              },
              items: workshopList.map((ComboValueType item) {
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

  @override
  Widget build(BuildContext context) {
    ownContext = context;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
        child: Container(
          height: 500,
          child: Column(
            children: [
              Container(
                height: 150,
              ),
              Container(
                height: 300,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.indigoAccent[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            '작업장 : ',
                            style: TextStyle(
                                fontSize: 28.0,
                                color: Colors.white,
                                fontFamily: "Roboto"),
                          ),
                          Container(
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(8)),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: 150,
                                    alignment: Alignment.centerRight,
                                    child: createWorkshopDropDownButton(
                                      _datas,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 160),
                        ),
                        // NotiPage(
                        //   msg: _msgData,
                        //   nHeight: 50,
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey[900],
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          iconSize: 28,
          unselectedFontSize: 20,
          selectedFontSize: 20,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '작업장 조회',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.save),
              label: '저장',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: '이전화면',
            ),
          ],
          onTap: (index) => {
                if (index == 0)
                  {
                    //setLocationList(),
                    showCircularProgressIndicator(context),
                  }
                else if (index == 1)
                  {
                    setDefaultWorkshop(
                      _selectedValue!,
                    ),
                  }
                else if (index == 2)
                  {
                    if (Navigator.canPop(context))
                      {
                        Navigator.pop(context),
                      }
                    else
                      {
                        //종료
                        Future.delayed(const Duration(seconds: 1), () async {
                          SystemNavigator.pop();
                        }),
                      }
                  }
              }),
    );
  }
}

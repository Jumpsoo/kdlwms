import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/kdl_common/notify_frame.dart';
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
  late SettingWorkshopViewModel viewModel;

  // List<ComboValueType> _datas = [
  //   ComboValueType(key: "Key 1", value: "2공장 1층"),
  //   ComboValueType(key: "Key 2", value: "2공장 2층"),
  //   ComboValueType(key: "Key 3", value: "2공장 3층"),
  //   ComboValueType(key: "Key 4", value: "2공장 4층"),
  //   ComboValueType(key: "Key 5", value: "2공장 5층"),
  // ];

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

  }

  //최초로딩시 콤보박스 세팅
  //데이터가 없는 경우 하단 알람 창에 메세지 전시
  Future<void> setLocationList()  async {

    setState(() async {
      List<TbCmLocation>? retList =
          await viewModel.useCaseTbCmLocation.selectTbCmLocationAll();
      if (retList != null && retList.isNotEmpty) {
      }else{
        _msgData = '내려받은 정보가 없습니다. 다시 내려받거나 관리자에게 문의하세요.';

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<SettingWorkshopViewModel>();
    ownContext = context;
    List<TbCmLocation> retList = [];
    setLocationList();

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
                                    child: DropdownButton<String>(
                                      items: _datas
                                          .map((data) =>
                                              DropdownMenuItem<String>(
                                                child: Text(data.key),
                                                value: data.value,
                                              ))
                                          .toList(),

                                      icon: const Icon(
                                        Icons.arrow_drop_down_circle_sharp,
                                        color: Colors.black,
                                      ),
                                      elevation: 16,
                                      alignment: Alignment.centerRight,
                                      style: const TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.black,
                                          fontFamily: "Roboto"),
                                      // icon: const Icon(
                                      //   Icons.arrow_drop_down_circle_sharp,
                                      //   color: Colors.black,
                                      // ),
                                      onChanged: (String? value) {},
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
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 160),
                        ),
                        NotiPage(
                          msg: _msgData,
                          nHeight: 50,
                        ),
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
                  {}
                else if (index == 1)
                  {}
                else if (index == 2)
                  {
                    //종료
                    Future.delayed(const Duration(seconds: 1), () async {
                      SystemNavigator.pop();
                    }),
                  }
              }),
    );
  }
}

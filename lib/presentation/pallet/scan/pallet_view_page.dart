import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_common_function.dart';
import 'package:provider/provider.dart';

import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:kdlwms/presentation/pallet/components/pack_grid_top.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';

class PalletViewPage extends StatefulWidget {
  final String title;

  const PalletViewPage({Key? key, required this.title}) : super(key: key);

  @override
  State<PalletViewPage> createState() => _PalletViewPageState();
}

class _PalletViewPageState extends State<PalletViewPage> {
  late BuildContext ownContext;

  static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;

  //Data 조회용
  final List<TbWhPallet> pallets = [];
  List<PlutoRow> topGridRows = [];

  late PalletViewModel viewModel;
  late SettingWorkshopViewModel viewModelShop;

  // 그리드메니저
  late final PlutoGridStateManager topGridStateManager;
  late final PlutoGridStateManager packGridStateManager;

  bool isLoading = true;

  String? _msgData = "OK";

  //창고위치 및 작업위치
  String _selectedPalletMasterInfo = '';
  String? _selectedValue;
  List<ComboValueType> _datas = [];

  @override
  // init에는 watch 사용 금지
  void initState() {
    super.initState();

    setState(() {
      _selectedPalletMasterInfo = '';
    });

    //작업장 불러오기
    setLocationList();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<PalletViewModel>();
    ownContext = context;

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 10, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Column(
                    children: [
                      //작업장 스캔
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () async {
                            // To do
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(85, 40),
                            primary: Colors.teal[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const AutoSizeText(
                            '작업위치',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontFamily: "Roboto"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //우측 창고
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        width: 150,
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: createLocationDropDownButton(
                          _datas,
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.only(right: 10),
                  //       alignment: Alignment.centerLeft,
                  //       width: 70.0,
                  //       child: ElevatedButton(
                  //         onPressed: () async {
                  //           // To do
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           fixedSize: const Size(70, 40),
                  //           primary: Colors.teal[300],
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(5),
                  //           ),
                  //         ),
                  //         child: const AutoSizeText(
                  //           '창고',
                  //           style: TextStyle(
                  //               fontSize: 18.0,
                  //               color: Colors.white,
                  //               fontFamily: "Roboto"),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 80,
                        child: AutoSizeText(
                          _selectedPalletMasterInfo,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontFamily: "Roboto"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            //하단그리드

            Container(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              height: 190,
              child: PlutoGrid(
                columns: getTopGridColumns(),
                rows: [],
                // columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  topGridStateManager = event.stateManager;
                  palletCommonViewTopList(context, topGridStateManager,
                      _selectedValue ?? "", _selectedPalletMasterInfo);
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  //to do
                },
                configuration: const PlutoGridConfiguration(
                  enterKeyAction: PlutoGridEnterKeyAction.none,
                  enableColumnBorder: true,
                  rowHeight: 30,
                  columnHeight: 30,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              height: 150,
              child: PlutoGrid(
                columns: getPackGridColumns(),
                rows: [],
                // columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  packGridStateManager = event.stateManager;
                   palletCommonViewPackingList(context, packGridStateManager,
                      _selectedValue ?? "", _selectedPalletMasterInfo);
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  //to do
                },
                configuration: const PlutoGridConfiguration(
                  enterKeyAction: PlutoGridEnterKeyAction.none,
                  enableColumnBorder: true,
                  rowHeight: 30,
                  columnHeight: 30,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey[900],
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '조회',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.clear),
              label: '삭제',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: '전화면',
            ),
          ],
          onTap: (index) => {
                if (index == 0)
                  {
                    //조회
                    viewAll(_selectedValue!, _selectedPalletMasterInfo),
                  }
                else if (index == 1)
                  {
                    deletePackItem(
                      context,
                      topGridStateManager,
                    ),
                  }
                else if (index == 2)
                  {
                    //종료
                    Future.delayed(const Duration(seconds: 1), () async {
                      Navigator.pop(context);
                    }),
                  }
              }),
    );
  }

  Widget createLocationDropDownButton(List<ComboValueType> locationList) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white60,
          border: Border.all(
              color: Colors.black87, width: 1, style: BorderStyle.solid),
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
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                }
              },
              selectedItemBuilder: (BuildContext context) {
                return locationList.map<Widget>((ComboValueType item) {
                  return Text(item.value);
                }).toList();
              },
              items: locationList.map((ComboValueType item) {
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

  Future<void> viewAll(String sLocation, String sWareHouse) async {
    palletCommonViewTopList(
        context, topGridStateManager, sLocation, sWareHouse);
    palletCommonViewPackingList(
        context, packGridStateManager, sLocation, sWareHouse);
  }

  //최초로딩시 콤보박스 세팅
  //데이터가 없는 경우 하단 알람 창에 메세지 전시
  Future<void> setLocationList() async {
    List<ComboValueType> comboList = await palletCommonGetLocationComboValueList(context);
    String? sDefaultLocation = await palletCommonGetDefaultWorkShop(context);

    setState(() {
      _datas = comboList;
      _selectedValue = sDefaultLocation;
    });
  }
}

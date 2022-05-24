import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/kdl_common/notify_frame.dart';
import 'package:provider/provider.dart';

import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:kdlwms/presentation/pallet/components/pack_grid_top.dart';

//상태
enum TopGridColumnIndex {
  SEQ,
  ITEM_NO,
  ITEM_LOT,
  QUANTITY,
  BOX_NO,
  PALLET_SEQ,
}

enum PackGridColumnIndex {
  SEQ,
  ITEM_NO,
  ITEM_LOT,
  QUANTITY,
  BOX_NO,
  PALLET_SEQ,
}

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

  // 그리드메니저
  late final PlutoGridStateManager topGridStateManager;
  late final PlutoGridStateManager packGridStateManager;

  bool isLoading = true;

  String? _msgData = "OK";

  //창고위치 및 작업위치
  String _selectedLocation = '';
  String _selectedPalletMasterInfo = '';


  List<ComboValueType> _datas = [
    ComboValueType(key: "Key 1", value: "2공장 1층"),
    ComboValueType(key: "Key 2", value: "2공장 2층"),
    ComboValueType(key: "Key 3", value: "2공장 3층"),
    ComboValueType(key: "Key 4", value: "2공장 4층"),
    ComboValueType(key: "Key 5", value: "2공장 5층"),
  ];

  @override
  // init에는 watch 사용 금지
  void initState() {
    super.initState();

    setState(() {
      _selectedLocation = 'WORK#5';
      _selectedPalletMasterInfo = '';
    });
  }

  // 상태 메세지 변경
  void _setMsg(String sMsg) {
    setState(() {
      _msgData = sMsg;
    });
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
              padding: const EdgeInsets.only(
                  left: 5, right: 10, top: 10, bottom: 10),
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
                              padding:
                                  const EdgeInsets.only(left: 5, right: 40),
                              width: 110,
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                _selectedLocation,
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              alignment: Alignment.centerLeft,
                              width: 70.0,
                              child: ElevatedButton(
                                onPressed: () async {
                                  // To do
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(70, 40),
                                  primary: Colors.teal[300],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const AutoSizeText(
                                  '창고',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                      fontFamily: "Roboto"),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        viewTopList(
                            _selectedLocation, _selectedPalletMasterInfo);
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
                    height: 190,
                    child: PlutoGrid(
                      columns: getPackGridColumns(),
                      rows: [],
                      // columnGroups: columnGroups,
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        packGridStateManager = event.stateManager;
                        viewPackingList(
                            _selectedLocation, _selectedPalletMasterInfo);
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
                  //알람 메시지
                  NotiPage(
                    msg: _msgData!,
                    nHeight: 40,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey[900],
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: '완료',
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
                    viewAll(_selectedLocation, _selectedPalletMasterInfo),
                  }
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

  Future<void> viewAll(String sLocation, String sWareHouse) async {
    viewTopList(sLocation, sWareHouse);

    viewPackingList(sLocation, sWareHouse);
  }

  //작업위치, 창고별 조회
  // 리스트 초기화 -> 데이터 조회 -> 바인딩
  Future<void> viewTopList(
    String sLocation,
    String sWareHouse,
  ) async {
    //초기화
    topGridStateManager.rows.clear();
    //조회
    List<TbWhPallet>? pallets = await viewModel.useCasesWms
        .listPallets(sLocation, sWareHouse, LoadState.Pack.index);
    //바인딩
    if (pallets!.isEmpty) {
      _setMsg('해당 작업위치에 입력완료한 실적이 없습니다.');
    } else {
      topGridStateManager.appendRows(
        getTopGridRows(pallets),
      );
      topGridStateManager.notifyListeners();
    }
  }

  // 하단그리드용 그리드 조회 메서드
  // 상태가 입력(packing) 중인 항목만 조회된다.
  // 기존행 클리어 -> 조회 -> 바인딩
  Future<void> viewPackingList(String sLocation, String sWareHouse) async {
    //초기화
    packGridStateManager.rows.clear();
    //조회
    List<TbWhPallet>? pallets = await viewModel.useCasesWms
        .listPallets(sLocation, sWareHouse, LoadState.Confirm.index);
    //바인딩
    if (pallets == null) {
      // _setMsg('해당 작업위치에 입력완료한 실적이 없습니다.');
    } else {
      packGridStateManager.appendRows(
        getPackGridRows(pallets),
      );
      packGridStateManager.notifyListeners();
    }
  }

  //삭제
  void deletePackItem() async {
    if (await checkValue('DELETE') == false) {
      return;
    }

    List<TbWhPallet> pallets = [];
    for (PlutoRow row in topGridStateManager.rows) {
      List<PlutoCell> cells = row.cells.values.toList();
      pallets.add(TbWhPallet(
          PALLET_SEQ: cells[TopGridColumnIndex.PALLET_SEQ.index].value,
          STATE: 1));
    }

    if (pallets.isEmpty) {
      _setMsg('완료처리 할 내용이 없습니다.');
      return;
    }
    viewModel.updatePalletState(pallets);
    showAlertDialog(ownContext, '정상처리 되었습니다.');

    viewAll(_selectedLocation, _selectedPalletMasterInfo);
  }

  //체크로직, 완료, 삭제 시
  Future<bool> checkValue(String confirm) async {
    switch (confirm) {
      case 'CONFIRM':
        if (await showAlertDialogQ(
              ownContext,
              '확인',
              '작업 중인 내용을 완료처리 하시겠습니까?',
            ) ==
            false) {
          return false;
        }
        break;
      case 'DELETE':
        if (await showAlertDialogQ(
              ownContext,
              '확인',
              '작업 중인 내용을 삭제 하시겠습니까?',
            ) ==
            false) {
          return false;
        }
        break;
    }
    return true;
  }
}

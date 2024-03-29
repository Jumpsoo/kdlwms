import 'dart:async';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_common_function.dart';
import 'package:kdlwms/presentation/pallet/sub_functions/pallet_view_functions.dart';
import 'package:pointmobile_scanner/pointmobile_scanner.dart';
import 'package:provider/provider.dart';

import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';

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

  //창고위치 및 작업위치
  String _readWorkShop = '';
  String _readLocation = '';
  String _decodeResult = '';

  //콤보박스용 변수
  List<ComboValueType> _dataWorkshop = [];
  List<ComboValueType> _dataLocation = [];

  // QR 리딩값 분기용 변수 2개

  String _readQRData = "";
  final _controller = TextEditingController();
  StreamSubscription? _subscription;

  //Data 조회용
  final List<TbWhPallet> pallets = [];
  List<PlutoRow> topGridRows = [];

  late PalletViewModel viewModel;
  late SettingInfoViewModel viewModelShop;

  // 그리드메니저
  late final PlutoGridStateManager topGridStateManager;
  late final PlutoGridStateManager downGridStateManager;

  @override
  // init에는 watch 사용 금지
  void initState() {
    super.initState();

    setState(() {
      _decodeResult = "준비";
      _readWorkShop = '';
      _readLocation = '';
      // 향후 사업장 정해지면 구현할것
      //gComps = 'C1';
    });

    // 실제 장비 연결시 주석 해제 할것
    // 실제장비가 아닌경우 shutdown 되기 때문에, 연결장비에 따라 분기한다.
    if (Platform.isAndroid) {
      setBarcodeScanner();
      writeLog('Set Scan : OK!');
    }

    //작업장 불러오기
    setWorkshopList();

    //창고 불러오기
    setLocationList();

    //프로그래스바
    hideCircularProgressIndicator();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => showCustomSnackBarSuccess(
              context,
              '로케이션을 먼저 스캔하세요.',
              false,
            ));
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
        padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
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
                            //서버 동기화 체크
                            await checkSyncStatus(context);

                            showCustomSnackBarSuccess(
                              context,
                              '로케이션 번호를 읽히세요.',
                              false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 40),
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
                        width: 250,
                        height: 40,
                        alignment: Alignment.center,
                        child: createLocationDropDownButton(
                          _dataLocation,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        width: 0.0,
                        child: ElevatedButton(
                          onPressed: () async {
                            //서버 동기화 체크
                            await checkSyncStatus(context);

                            //해당버튼을 누르면 창고위치로 값을 넘겨준다
                            showCustomSnackBarSuccess(
                              context,
                              '창고 QR을 입력하세요.',
                              false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(70, 40),
                            primary: Colors.teal[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const AutoSizeText(
                            '',
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
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        width: 0,
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: createWorkshopDropDownButton(
                          _dataWorkshop,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            //하단그리드

            SizedBox(
              height: 180,
              child: PlutoGrid(
                columns: getViewTopGridColumns(),
                mode: PlutoGridMode.select,
                rows: [],
                // columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  topGridStateManager = event.stateManager;
                  viewTopList();
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  //to do
                },
                configuration: getGridStyle1(),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            SizedBox(
              height: 230,
              child: PlutoGrid(
                columns: getPackGridColumns(),
                rows: [],
                // columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  downGridStateManager = event.stateManager;
                  viewBottomList();
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  //to do
                },
                configuration: getGridStyle1(),
              ),
            ),
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
                    viewAll(_readWorkShop, _readLocation),
                  }
                else if (index == 1)
                  {
                    deletePackedPallet(),
                  }
                else if (index == 2)
                  {
                    //종료
                    Future.delayed(const Duration(seconds: 1), () async {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      Navigator.pop(context);
                    }),
                  }
              }),
    );
  }

  void deletePackedPallet() async {
    bool bRet = await _deletePackItem(
        context, downGridStateManager, _readWorkShop, _readLocation);

    if (bRet) {
      viewAll(_readWorkShop, _readLocation);
    }
  }

  // 리딩한 작업내용을 아래 그리드에 추가함
  // 값 파싱->임시저장 -> 재조회
  // 상차화면에서는 실적입력안함
  void _changeReadQrData(String sQrData) async {
    try {
      //공백일 경우에러 발생
      if (_readWorkShop.isEmpty) {
        showCustomSnackBarWarn(context, '작업위치를 먼저 설정하세요.');
        return;
      }
      if (_readLocation.isEmpty) {
        showCustomSnackBarWarn(context, '창고를 먼저 스캔하세요.');
        return;
      }
    } catch (e) {
      writeLog(e.toString());
    }
  }

  //상단 리스트 조회
  void viewTopList() {
    createPalletingTopGridView(
      context,
      topGridStateManager,
      _readWorkShop,
      _readLocation,
    );
  }

  //하단 리스트 조회
  void viewBottomList() {
    createPalletingButtomGridView(
      context,
      downGridStateManager,
      _readWorkShop,
      _readLocation,
    );
  }

  //
  // 저장
  // void _changeWorkshop(String sLocation) {
  //   setState(() {
  //     _readWorkShop = sLocation;
  //     viewBottomList();
  //   });
  // }

  //창고QR 리딩
  void _changeLocation(String sReadLocation) {
    setState(() {
      _readLocation = sReadLocation;
    });
    viewAll(_readWorkShop, _readLocation);
  }

  Future<void> viewAll(String? sWareHouse, String? sLocation) async {
    viewTopList();
    viewBottomList();
  }

  //최초로딩시 콤보박스 세팅
  //데이터가 없는 경우 하단 알람 창에 메세지 전시
  Future<void> setWorkshopList() async {
    List<ComboValueType> comboList = await getWorkshopComboValueList(context);
    String? sDefaultLocation = await palletCommonGetDefaultWorkShop(context);

    setState(() {
      _dataWorkshop = comboList;

      _readWorkShop = sDefaultLocation!;
      if (sDefaultLocation.isNotEmpty) {
        _readWorkShop = sDefaultLocation;
      }

      // if (sDefaultLocation == '') {
      //   showCustomSnackBarSuccess(context, '로케이션을 먼저 스캔하세요.');
      // }
    });
  }

  Future<void> setLocationList() async {
    List<ComboValueType> comboList = await getLocationComboValueList(context);

    setState(() {
      _dataLocation = comboList;
    });
  }

//선택된 항목 삭제
  Future<bool> _deletePackItem(
      BuildContext context,
      PlutoGridStateManager gridStateManager,
      String sWorkshop,
      String sLocation) async {
    PalletViewModel viewModel = context.read<PalletViewModel>();

    if (await _checkValue(context, 'DELETE', gridStateManager, '') == false) {
      return false;
    }
    List<TbWhPallet> tbWhPallets = [];

    // for (PlutoRow row in gridStateManager.currentSelectingRows) {
    PlutoRow row = gridStateManager.currentCell!.row;
    List<PlutoCell> cells = row.cells.values.toList();

    tbWhPallets.add(TbWhPallet(
        comps: gComps,
        workshop: sWorkshop,
        location: sLocation,
        itemNo: cells[1].value,
        itemLot: cells[2].value,
        quantity: cells[4].value,
        palletSeq: cells[3].value,
        barcode: cells[5].value));

    if (tbWhPallets.isEmpty) {
      hideCircularProgressIndicator();
      showCustomSnackBarWarn(context, '완료처리 할 내용이 없습니다.');
      return false;
    }

    viewModel.useCasesWms.deletePallet(tbWhPallets);
    showCustomSnackBarSuccess(
      context,
      gSuccessMsg,
      true,
    );

    return true;
  }

  //작업위치 콤보박스
  Widget createWorkshopDropDownButton(List<ComboValueType> workshopList) {
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
              iconSize: 30,
              elevation: 15,
              value: _readWorkShop,
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _readWorkShop = newValue;
                    viewAll(_readWorkShop, _readWorkShop);
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

//체크로직, 완료, 삭제 시
  Future<bool> _checkValue(
    BuildContext context,
    String sGbn,
    PlutoGridStateManager gridStateManager,
    String sQrCode,
  ) async {
    switch (sGbn) {
      case 'DELETE':
        if (gridStateManager.currentCell == null) {
          showCustomSnackBarWarn(context, '삭제할 항목이 선택하세요.');
          return false;
        }
        if (gridStateManager.rows.isEmpty) {
          showCustomSnackBarWarn(context, '삭제할 항목이 없습니다.');
          return false;
        }
        if (await showAlertDialogQ(
              context,
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

  //창고 콤보박스
  Widget createLocationDropDownButton(List<ComboValueType> workshopList) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
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
              iconSize: 30,
              elevation: 15,
              value: _readLocation,
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _readLocation = newValue;
                    viewAll(_readWorkShop, _readLocation);
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
  void dispose() {
    // TODO: implement dispose
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  //스캐너 모듈 초기화
  void setBarcodeScanner() {
    PointmobileScanner.channel.setMethodCallHandler(_onBarcodeScannerHandler);
    PointmobileScanner.initScanner();
    PointmobileScanner.enableScanner();
    PointmobileScanner.enableBeep();
    PointmobileScanner.enableSymbology(PointmobileScanner.SYM_CODE128);
    PointmobileScanner.enableSymbology(PointmobileScanner.SYM_EAN13);
    PointmobileScanner.enableSymbology(PointmobileScanner.SYM_QR);
    PointmobileScanner.enableSymbology(PointmobileScanner.SYM_UPCA);
  }

  //바코드 관련 이벤트 및 함수 선언부분
  Future<void> _onBarcodeScannerHandler(MethodCall call) async {
    //공장코드 미설정 시 작업장 화면에서 설정하도록 할것
    if (gComps.isEmpty) {
      showAlertDialog(context, '(진행불가) 공장 정보 미설정. \r\n 작업장 설정 화면에서 설정필요 ');
      return;
    }
    try {
      if (call.method == PointmobileScanner.ON_DECODE) {
        // showCircularProgressIndicator(context);
        _onDecode(call);
        // await hideCircularProgressIndicator();
      } else if (call.method == PointmobileScanner.ON_ERROR) {
        _onError(call.arguments);
      } else {
        //
      }
    } catch (e) {
      writeLog(e.toString());
    }
  }

  // (중요) 바코드 읽혔을 때 처리 이벤트
  void _onDecode(MethodCall call) {
    final List lDecodeResult = call.arguments;
    String? sVal = lDecodeResult[1];

    if (sVal == 'READ_FAIL') {
      return;
    }

    //로케이션번호일경우
    //TAG 리스트 스캔시 해당분기로 빠지는걸 방지
    if (sVal != null && sVal.length < 4 && sVal.substring(0, 1) == 'L') {
      //Location
      _readLocation = sVal;
      _changeLocation(_readLocation);
    } else if (sVal != null && sVal.length > 100) {
      //제품 QR
      _readQRData = sVal;
      _changeReadQrData(_readQRData);
    } else {
      showCustomSnackBarWarn(context, '스캔한 작업 코드가 부적절합니다.');
    }
  }

  void _onError(Exception error) {
    setState(() {
      _decodeResult = error.toString();
    });
  }

// void _onExit() {
//   PointmobileScanner.disableScanner();
//   Navigator.pop(context);
// }
}

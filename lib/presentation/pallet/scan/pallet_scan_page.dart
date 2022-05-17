import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/kdl_common/notify_frame.dart';
import 'package:kdlwms/presentation/pallet/components/pack_grid_top.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pointmobile_scanner/pointmobile_scanner.dart';
import 'package:provider/provider.dart';

//상태
enum TopGridColumnIndex { SEQ, ITEM_NO, ITEM_LOT, QUANTITY, BOX_NO, PALLET_SEQ }
enum PackGridColumnIndex {
  SEQ,
  ITEM_NO,
  ITEM_LOT,
  QUANTITY,
  BOX_NO,
  PALLET_SEQ
}

class PalletScanPage extends StatefulWidget {
  const PalletScanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PalletScanPage> createState() => _PalletScanPageState();
}

class _PalletScanPageState extends State<PalletScanPage> {
  late BuildContext ownContext;

  static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;

  // QR => 실적,  LOC => 위치
  static const String sQR = 'QR';
  static const String sLOC = 'LOC';
  static const String sWH = 'WH';
  bool isLoading = true;
  String _decodeResult = '';

  //창고는 콤보박스

  //창고위치 및 작업위치
  String _readLocation = '';
  String _readPalletMasterInfo = '';

  // 스캐너 분기용용
  String? _sReadItemGbn = "QR";

  // QR 리딩값 분기용 변수 2개

  String _readQRData = "";
  String? _msgData = "OK";
  final _controller = TextEditingController();
  StreamSubscription? _subscription;

  //Data 조회용
  final List<Pallet> pallets = [];
  List<PlutoRow> topGridRows = [];

  late PalletViewModel viewModel;

  // 그리드메니저
  late final PlutoGridStateManager topGridStateManager;
  late final PlutoGridStateManager packGridStateManager;

  @override
  // init에는 watch 사용 금지
  void initState() {
    super.initState();

    setState(() {
      _sReadItemGbn = sQR;
      _decodeResult = "준비";
      _readLocation = '';
      isLoading = false;
      //for test
      _readLocation = 'WORK#5';
    });
    // 실제 장비 연결시 주석 해제 할것
    //setBarcodeScanner();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<PalletViewModel>();
    ownContext = context;

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('팔레팅 작업(실적입력)'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : Padding(
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
                                  _setMsg("팔레트위치 QR을 읽히세요.");
                                  //해당버튼을 누르면 창고위치로 값을 넘겨준다
                                  _sReadItemGbn = sLOC;
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
                                _readLocation,
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
                                  //해당버튼을 누르면 창고위치로 값을 넘겨준다
                                  _sReadItemGbn = sWH;
                                  _setMsg('창고 QR을 입력하세요.');
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
                                _readPalletMasterInfo,
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
                        viewTopList(_readLocation, _readPalletMasterInfo);
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
                        viewPackingList(_readLocation, _readPalletMasterInfo);
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
                    msg: _msgData!, nHeight: 40,                    
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
                    //완료처리
                    confirmPacking(),
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

  void buttonPressed() {}

  // 환경 설정 메뉴 호출
  void fabPressed() {}

  // 리딩한 작업내용을 아래 그리드에 추가함
  // 값 파싱->임시저장 -> 재조회
  void _changeReadQrData(String sQrData) {
    setState(() async {
      if (await viewModel.addPallet(sQrData)) {
        viewTopList(_readLocation, _readPalletMasterInfo);
      }
    });
  }

  //작업위치 저장
  void _changeLocation(String sLocation) {
    setState(() {
      _readLocation = sLocation;
      viewPackingList(_readLocation, _readPalletMasterInfo);
    });
  }

  //창고QR 리딩
  void _changeWarehouse(String sReadWarehouse) {
    setState(() {
      _readPalletMasterInfo = sReadWarehouse;
      // viewPackingList(_readLocation, _readWarehouse);
    });
  }

  // 상태 메세지 변경
  void _setMsg(String sMsg) {
    setState(() {
      _msgData = sMsg;
    });
  }

  Future<void> viewAll(String sLocation, String sWareHouse) async {

    viewTopList(sLocation, sWareHouse);

    viewPackingList(sLocation, sWareHouse);
  }

  //작업위치, 창고별 조회
  // 리스트 초기화 -> 데이터 조회 -> 바인딩
  Future<void> viewTopList(String sLocation, String sWareHouse,) async {
    //초기화
    topGridStateManager.rows.clear();
    //조회
    List<Pallet>? pallets = await viewModel.useCasesWms
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
    List<Pallet>? pallets = await viewModel.useCasesWms
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

  // 작업중인 내용 확정 처리
  void confirmPacking() async {
    if (await checkValue('CONFIRM') == false) {
      return;
    }
    List<Pallet> pallets = [];
    for (PlutoRow row in topGridStateManager.rows) {
      List<PlutoCell> cells = row.cells.values.toList();
      pallets.add(Pallet(
          PALLET_SEQ: cells[TopGridColumnIndex.PALLET_SEQ.index].value,
          STATE: 1));
    }
    if (pallets.isEmpty) {
      _setMsg('완료처리 할 내용이 없습니다.');
      return;
    }
    await viewModel.updatePalletState(pallets);
    await showAlertDialog(ownContext, '정상처리 되었습니다.');

    viewTopList(_readLocation, _readPalletMasterInfo);
  }

  //삭제
  void deletePackItem() async {
    if (await checkValue('DELETE') == false) {
      return;
    }

    List<Pallet> pallets = [];
    for (PlutoRow row in topGridStateManager.rows) {
      List<PlutoCell> cells = row.cells.values.toList();
      pallets.add(Pallet(
          PALLET_SEQ: cells[TopGridColumnIndex.PALLET_SEQ.index].value,
          STATE: 1));
    }

    if (pallets.isEmpty) {
      _setMsg('완료처리 할 내용이 없습니다.');
      return;
    }
    viewModel.updatePalletState(pallets);
    showAlertDialog(ownContext, '정상처리 되었습니다.');

    viewAll(_readLocation, _readPalletMasterInfo);
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
    try {
      if (call.method == PointmobileScanner.ON_DECODE) {
        _onDecode(call);
      } else if (call.method == PointmobileScanner.ON_ERROR) {
        _onError(call.arguments);
      } else {
        //
      }
    } catch (e) {
      print(e);
    }
  }

  void _onDecode(MethodCall call) {
    final List lDecodeResult = call.arguments;
    String? sVal = lDecodeResult[1];
    setState(() {
      switch (_sReadItemGbn) {
        case sQR:
          //공백일 경우에러 발생
          if (_readLocation.isEmpty == true) {
            _setMsg('작업위치를 먼저 스캔하세요.');
            return;
          } else {
            _readQRData = sVal ?? ' ';
            _changeReadQrData(_readQRData);
          }
          break;
        case sLOC:
          _readLocation = sVal ?? '';
          _changeLocation(_readLocation);
          break;
        case sWH:
          _readPalletMasterInfo = sVal ?? '';
          _changeWarehouse(_readPalletMasterInfo);
          break;
        default:
          _readQRData = sVal ?? '';
          _changeReadQrData(_readQRData);
          break;
      }
    });
    _sReadItemGbn = sQR;
  }

  void _onError(Exception error) {
    setState(() {
      _decodeResult = error.toString();
    });
  }

  void _onExit() {
    PointmobileScanner.disableScanner();
    SystemNavigator.pop();
  }
}

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/kdl_common/notify_frame.dart';
import 'package:kdlwms/presentation/pallet/components/pack_grid_top.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_events.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pointmobile_scanner/pointmobile_scanner.dart';
import 'package:provider/provider.dart';

class PalletScanPage extends StatefulWidget {
  const PalletScanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PalletScanPage> createState() => _PalletScanPageState();
}

class _PalletScanPageState extends State<PalletScanPage> {
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;
  String? _decodeResult = "Unknown";

  // QR => 실적,  LOC => 위치
  static const String sQR = 'QR';
  static const String sLOC = 'LOC';
  bool isLoading = true;

  //창고는 콤보박스

  //창고위치 및 작업위치
  String _readLocation = '';
  String _selectedWarehouse = '';

  // 스캐너 분기용용
  String? _sGbn = "QR";

  // QR 리딩값 분기용 변수 2개
  String _qrData = "";
  String? _msgData = "OK";
  final _controller = TextEditingController();
  StreamSubscription? _subscription;

  //Data 조회용
  final List<Pallet> pallets = [];
  List<PlutoRow> topGridRows = [];

  late PalletViewModel viewModel;
  late final PlutoGridStateManager _stateManager;

  @override
  // init에는 watch 사용 금지
  void initState() {
    super.initState();

    setState(() {
      _sGbn = sQR;
      _decodeResult = "준비";
      _readLocation = '';
      isLoading = false;
      //for test
      _readLocation = 'WORK#5';
    });
    // 실제 장비 연결시 해제 할것
    //setBarcodeScanner();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<PalletViewModel>();
    final state = viewModel.state;

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
                                  _sGbn = sLOC;
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
                                  //팝업 또는 콤보리스트 보여 줄 것
                                  String qrTestData =
                                      '9	WORK#5	LOC001	08698K-1168	IG99922	2	0	00011';
                                  _changeReadQrData(qrTestData);
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
                                _selectedWarehouse,
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
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    height: 360,
                    child: PlutoGrid(
                      columns: getPackGridColumns(),
                      rows: [],
                      // columnGroups: columnGroups,
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        _stateManager = event.stateManager;
                      },
                      onChanged: (PlutoGridOnChangedEvent event) {
                        //
                      },
                      configuration: const PlutoGridConfiguration(
                        enableColumnBorder: true,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  //알람 메시지
                  NotiPage(
                    msg: _msgData!,
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
            )
          ],
          onTap: (index) => {
                if (index == 0)
                  {
                    //완료처리
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

  // Future<void> _changeReadQrData(String sQrData) async{
  // 값 파싱->임시저장 -> 재조회-> grid append
  void _changeReadQrData(String sQrData) {
    setState(() async {
      List<Pallet> pallets = [];
      //저장(파싱포함)
      viewModel.addPallet(sQrData);
      _stateManager.appendRows(
        getPackGridRows(
          await viewList(_readLocation, _selectedWarehouse),
        ),
      );
    });
  }

  //작업위치 저장
  void _changeLocation(String sLocation) {
    setState(() {
      _readLocation = sLocation;
      _setMsg('준비');
    });
  }

  // 상태 메세지 변경
  void _setMsg(String sMsg) {
    setState(() {
      _msgData = sMsg;
    });
  }

  Future<List<Pallet>> viewList(String sLocation, String sWareHouse) async {
    //파싱 후 작업장 기준 조회
    List<Pallet> pallets =
        await viewModel.useCasesWms.listPallets(_readLocation);
    if (pallets.isEmpty) {
      _setMsg('해당 작업위치에 입력중인 실적이 없습니다.');
    }
    return pallets;
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
    } catch (e) {}
  }

  void _onDecode(MethodCall call) {
    final List lDecodeResult = call.arguments;
    String? sVal = lDecodeResult[1];
    setState(() {
      switch (_sGbn) {
        case sQR:
          //공백일 경우에러 발생

          if (_readLocation.isEmpty == true) {
            _setMsg('작업위치를 먼저 스캔하세요.');
            return;
          } else {
            _qrData = sVal ?? ' ';
            _changeReadQrData(_qrData);
          }
          break;
        case sLOC:
          _readLocation = sVal ?? '';
          _changeLocation(_readLocation);
          break;
        default:
          _qrData = sVal ?? '';
          _changeReadQrData(_qrData);
          break;
      }
    });

    _sGbn = sQR;
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

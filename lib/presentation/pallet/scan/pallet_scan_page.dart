import 'dart:async';
import 'dart:io' show Platform;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/components/pack_grid_top.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_common_function.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pointmobile_scanner/pointmobile_scanner.dart';
import 'package:provider/provider.dart';

class PalletScanPage extends StatefulWidget {
  final String title;

  const PalletScanPage({Key? key, required this.title}) : super(key: key);

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
  String _readWorkShop = '';
  String _readLocation = '';

  //콤보박스용 변수
  String? _selectedValue = 'A';
  List<ComboValueType> _datas = [];

  // 스캐너 분기용용
  String? _sReadItemGbn = "QR";

  // QR 리딩값 분기용 변수 2개

  String _readQRData = "";
  String? _msgData = "OK";
  final _controller = TextEditingController();
  StreamSubscription? _subscription;

  //Data 조회용
  final List<TbWhPallet> pallets = [];
  List<PlutoRow> topGridRows = [];

  late PalletViewModel viewModel;
  late SettingInfoViewModel viewModelShop;

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
      _readWorkShop = '';
      isLoading = false;
      //for test, 지울것

      gComps = 'C1';
    });
    // 실제 장비 연결시 주석 해제 할것
    // 실제장비가 아닌경우 shutdown 되기 때문에, 연결장비에 따라 분기한다.
    if (Platform.isAndroid) {
      setBarcodeScanner();
      writeLog('Set Scan : OK!');
    }
    hideCircularProgressIndicator();
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
        body: isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0, top: 10, bottom: 10),
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

                                    // _setMsg("팔레트위치 QR을 읽히세요.");
                                    //해당버튼을 누르면 창고위치로 값을 넘겨준다
                                    _sReadItemGbn = sLOC;
                                    showCustomSnackBarSuccess(
                                        context, '작업위치 바코드를 읽히세요.');
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
                                    const EdgeInsets.only(left: 5, right: 5),
                                width: 120,
                                height: 30,
                                alignment: Alignment.centerLeft,
                                child: createLocationDropDownButton(
                                  _datas,
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 10),
                                alignment: Alignment.centerLeft,
                                width: 70.0,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    //서버 동기화 체크
                                    await checkSyncStatus(context);

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
                                width: 40,
                                child: AutoSizeText(
                                  _readLocation == '' ? '-' : _readLocation,
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
                      height: 190,
                      child: PlutoGrid(
                        columns: getTopGridColumns(),
                        mode: PlutoGridMode.select,
                        rows: [],
                        // columnGroups: columnGroups,
                        onLoaded: (PlutoGridOnLoadedEvent event) {
                          topGridStateManager = event.stateManager;
                          palletCommonViewTopList(context, topGridStateManager,
                              _selectedValue ?? "", _readLocation);
                        },
                        onChanged: (PlutoGridOnChangedEvent event) {
                          //to do
                        },
                        configuration: const PlutoGridConfiguration(
                          enterKeyAction: PlutoGridEnterKeyAction.none,
                          enableColumnBorder: true,
                          rowHeight: 30,
                          columnHeight: 30,
                          cellTextStyle: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Container(
                      height: 190,
                      child: PlutoGrid(
                        columns: getPackGridColumns(),
                        rows: [],
                        // columnGroups: columnGroups,
                        onLoaded: (PlutoGridOnLoadedEvent event) {
                          packGridStateManager = event.stateManager;
                          palletCommonViewBottomList(
                              context,
                              packGridStateManager,
                              _readWorkShop,
                              _readLocation);
                        },
                        onChanged: (PlutoGridOnChangedEvent event) {
                          //to do
                        },
                        configuration: const PlutoGridConfiguration(
                          enterKeyAction: PlutoGridEnterKeyAction.none,
                          rowHeight: 30,
                          columnHeight: 30,
                          cellTextStyle: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueGrey[900],
            unselectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.check), label: '완료'),
              BottomNavigationBarItem(icon: Icon(Icons.clear), label: '삭제'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_back), label: '전화면')
            ],
            onTap: (index) => {
                  if (index == 0)
                    {confirmPacking()} //완료, 완료처리및 서벚전송
                  else if (index == 1)
                    {
                      if (deletePackItem(
                            context,
                            topGridStateManager,
                            _readWorkShop,
                            _readLocation,
                          ) ==
                          true)
                        {viewAll(_readWorkShop, _readLocation)}
                    }
                  else if (index == 2)
                    {
                      Future.delayed(const Duration(seconds: 1), () async {
                        Navigator.pop(context);
                      })
                    }
                }));
  }

  // 리딩한 작업내용을 아래 그리드에 추가함
  // 값 파싱->임시저장 -> 재조회
  void _changeReadQrData(String sQrData) async {
    try {
      TbWhPallet? pallet = await viewModel.useCasesWms
          .scanQrCode(sQrData, _readWorkShop, _readLocation);
      if (pallet == null) {
        showCustomSnackBarWarn(context, '잘못된 식별표입니다. 식별표를 다시 확인하세요.');
        return;
      }

      Result result = await viewModel.useCasesWms.addPallet(pallet);
      result.when(success: (value) {
        palletCommonViewTopList(
            context, topGridStateManager, _readWorkShop, _readLocation);
      }, error: (message) {
        showCustomSnackBarWarn(context, message);
      });
    } catch (e) {
      writeLog(e.toString());
    }
  }

  //작업위치 저장
  void _changeLocation(String sLocation) {
    setState(() {
      _readWorkShop = sLocation;
      _selectedValue = sLocation;
      palletCommonViewBottomList(
          context, packGridStateManager, _readWorkShop, _readLocation);
    });
  }

  //창고QR 리딩
  void _changeWarehouse(String sReadWarehouse) {
    setState(() {
      _readLocation = sReadWarehouse;
      palletCommonViewBottomList(
          context, packGridStateManager, _readLocation, _readWorkShop);
    });
  }

  // 상태 메세지 변경
  void _setMsg(String sMsg) {
    setState(() {
      _msgData = sMsg;
    });
  }

  Future<void> viewAll(String sWareHouse, String sLocation) async {

    palletCommonViewTopList(
        context, topGridStateManager, sWareHouse, sLocation);

    palletCommonViewBottomList(
        context, packGridStateManager, sWareHouse, sLocation);
  }

  // 작업중인 내용 확정 처리
  // 확정 후 확정 리스트 서버로 송신
  void confirmPacking() async {
    if (await checkValue(context, 'CONFIRM', topGridStateManager, '') ==
        false) {
      return;
    }
    //상태를 2 로변경한다.
    //화면에서가 아닌 데이터 조회 후 전송한다.

    List<TbWhPallet>? pallets = await viewModel.useCasesWms
        .listPallets(_readWorkShop, _readLocation, LoadState.Pack.index);

    if (pallets!.isEmpty) {
      showCustomSnackBarWarn(context, '완료처리 할 내용이 없습니다.');
      return;
    }
    // 확정 처리 성공 시   서버전송

    await viewModel.useCasesWms.updatePalletFinishUseCase(pallets);

    await showCustomSnackBarSuccess(ownContext, '정상처리 되었습니다.');
    await viewAll(_readWorkShop, _readLocation);
  }

  //최초로딩시 콤보박스 세팅
  //데이터가 없는 경우 하단 알람 창에 메세지 전시
  Future<void> setLocationList() async {
    List<ComboValueType> comboList =
        await palletCommonGetLocationComboValueList(context);
    String? sDefaultLocation = await palletCommonGetDefaultWorkShop(context);

    setState(() {
      _datas = comboList;

      _selectedValue = sDefaultLocation;

      if (sDefaultLocation != null) {
        _readWorkShop = sDefaultLocation;
        viewAll(_readWorkShop, _readLocation);
      }
    });
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
              value: _selectedValue,
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedValue = newValue;
                    _readWorkShop = newValue;
                    viewAll(_readWorkShop, _selectedValue ?? '');
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
        _onDecode(call);
      } else if (call.method == PointmobileScanner.ON_ERROR) {
        _onError(call.arguments);
      } else {
        //
      }
    } catch (e) {
      writeLog(e.toString());
    }
  }

  void _onDecode(MethodCall call) {
    final List lDecodeResult = call.arguments;
    String? sVal = lDecodeResult[1];

    setState(() {
      switch (_sReadItemGbn) {
        case sQR:
          //공백일 경우에러 발생
          if (_readWorkShop.isEmpty == true) {
            showCustomSnackBarWarn(context, '작업위치를 먼저 스캔하세요.');

            return;
          } else {
            _readQRData = sVal ?? ' ';
            _changeReadQrData(_readQRData);
          }
          break;
        case sLOC:
          if (sVal != null && sVal.length > 10) {
            showCustomSnackBarWarn(context, '스캔한 작업 코드가 부적절합니다.');
          } else {
            _readWorkShop = sVal ?? '';
            _changeLocation(_readWorkShop);
          }
          break;
        case sWH:
          if (sVal != null && sVal.length > 10) {
            showCustomSnackBarWarn(context, '스캔한 창고 코드가 부적절합니다.');
          } else {
            //길이 체크
            _readLocation = sVal ?? '';
            _changeWarehouse(_readLocation);
          }
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
    Navigator.pop(context);
  }
}

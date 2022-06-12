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
import 'package:kdlwms/presentation/pallet/scan/pallet_local_variables.dart';
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
  late SettingWorkshopViewModel viewModelShop;

  // 그리드메니저
  late final PlutoGridStateManager topGridStateManager;
  late final PlutoGridStateManager packGridStateManager;

  @override
  // init에는 watch 사용 금지
  void initState()    {
    super.initState();

    setState(() {
      _sReadItemGbn = sQR;
      _decodeResult = "준비";
      _readWorkShop = '';
      isLoading = false;
      //for test, 지울것
      _readWorkShop = '';
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
                                    // _setMsg("팔레트위치 QR을 읽히세요.");
                                    //해당버튼을 누르면 창고위치로 값을 넘겨준다
                                    // _sReadItemGbn = sLOC;

                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PalletScanPage(
                                                  title: '팔레팅 작업(실적 입력)')),
                                    );
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
                                width: 150,
                                height: 30,
                                alignment: Alignment.centerLeft,
                                child: createLocationDropDownButton(
                                  _datas,
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
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
                                    //_changeReadQrData('DISC506002000001009100021012510415112071230515308154081550915207212730108000               099700-30700W  0000024I005 20220511051122000122220010044194');

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
                                  _readLocation,
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
                          palletCommonViewTopList(context, topGridStateManager, _selectedValue ?? "", _readLocation);
                        },
                        onChanged: (PlutoGridOnChangedEvent event) {
                          //to do
                        },
                        configuration: const PlutoGridConfiguration(
                            enterKeyAction: PlutoGridEnterKeyAction.none,
                            enableColumnBorder: true,
                            rowHeight: 30,
                            columnHeight: 30,
                            cellTextStyle: TextStyle(fontSize: 12)),
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
                          palletCommonViewBottomList(context, packGridStateManager,
                              _readWorkShop, _readLocation);
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
                    {confirmPacking()}
                  else if (index == 1)
                    {deletePackItem(context, topGridStateManager),}
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
  void _changeReadQrData(String sQrData) {
    setState(() async {
      TbWhPallet? pallet = await viewModel.useCasesWms
          .scanQrCode(sQrData, _readWorkShop, _readLocation);

      if (pallet == null) {
        _setMsg('잘못된 식별표입니다. 식별표를 다시 확인하세요.');
        return;
      }
      if (await viewModel.useCasesWms.addPallet(pallet)) {
        palletCommonViewTopList(
            context, topGridStateManager, _readWorkShop, _readLocation);
      }
    });
  }

  //작업위치 저장
  void _changeLocation(String sLocation) {
    setState(() {
      _readWorkShop = sLocation;
      palletCommonViewBottomList(
          context, packGridStateManager, _readWorkShop, _readLocation);
    });
  }

  //창고QR 리딩
  void _changeWarehouse(String sReadWarehouse) {
    setState(() {
      _readLocation = sReadWarehouse;
      palletCommonViewBottomList(context, packGridStateManager,_readLocation, _readWorkShop);
    });
  }

  // 상태 메세지 변경
  void _setMsg(String sMsg) {
    setState(() {
      _msgData = sMsg;
    });
  }

  Future<void> viewAll(String sLocation, String sWareHouse) async {
    palletCommonViewTopList(
        context, topGridStateManager, sLocation, sWareHouse);
    palletCommonViewBottomList(
        context, packGridStateManager, sLocation, sWareHouse);
  }

  // 작업중인 내용 확정 처리
  // 확정 후 확정 리스트 서버로 송신
  void confirmPacking() async {
    if (await checkValue(context, 'CONFIRM', topGridStateManager, '') == false) {
      return;
    }
    //상태를 2 로변경한다.
    List<TbWhPallet> pallets = [];
    for (PlutoRow row in topGridStateManager.rows) {
      List<PlutoCell> cells = row.cells.values.toList();
      pallets.add(TbWhPallet(
          palletSeq: cells[TopGridColumnIndex.palletSeq.index].value,
          boxNo: cells[TopGridColumnIndex.SEQ.index].value,
          state: 1));
    }
    if (pallets.isEmpty) {
      showCustomSnackBarWarn(context, '완료처리 할 내용이 없습니다.');
      return;
    }

    await viewModel.useCasesWms.updatePalletState(pallets);
    await showCustomSnackBarSuccess(ownContext, '정상처리 되었습니다.');
    await viewAll(_readWorkShop, _readLocation);
  }

  //최초로딩시 콤보박스 세팅
  //데이터가 없는 경우 하단 알람 창에 메세지 전시
  Future<void> setLocationList() async {
    List<ComboValueType> comboList = await palletCommonGetLocationComboValueList(context);
    String? sDefaultLocation = await palletCommonGetDefaultWorkShop(context);

    setState(() {
      _datas = comboList;
    });
    _selectedValue = sDefaultLocation;
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
                    _selectedValue =  newValue;
                    viewAll(_readLocation, _selectedValue ?? '');
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
            _setMsg('작업위치를 먼저 스캔하세요.');
            return;
          } else {
            _readQRData = sVal ?? ' ';
            _changeReadQrData(_readQRData);
          }
          break;
        case sLOC:
          _readWorkShop = sVal ?? '';
          _changeLocation(_readWorkShop);
          break;
        case sWH:
          _readLocation = sVal ?? '';
          _changeWarehouse(_readLocation);
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

import 'dart:async';
import 'dart:io' show Platform;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/model/tb_wh_item.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

import 'package:kdlwms/presentation/pallet/scan/pallet_common_function.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:kdlwms/presentation/pallet/sub_functions/pallet_scan_functions.dart';
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

  String _decodeResult = '';

  //창고는 콤보박스

  //창고위치 및 작업위치
  String _readWorkShop = '';
  String _readLocation = '';

  String _readWareHouse = '';
  String _readWareHouseNm = '';

  //콤보박스용 변수
  List<ComboValueType> _dataWorkshop = [];
  List<ComboValueType> _dataLocation = [];

  bool bTriggerOn = false;

  // QR 리딩값 분기용 변수 2개

  String _readQRData = "";
  final _controller = TextEditingController();
  StreamSubscription? _subscription;

  //Data 조회용
  final List<TbWhPallet> pallets = [];
  List<PlutoRow> topGridRows = [];

  late PalletViewModel viewModel;
  late SettingInfoViewModel viewCommon;

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

      _readWareHouse = '';
      _readWareHouseNm = '실적없음';

      //for test, 지울것
      gComps = 'C1';
    });

    //

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
    //
    // WidgetsBinding.instance.addPostFrameCallback((_) =>
    //     showCustomSnackBarSuccess(context, '로케이션을 먼저 리딩하거나 \r\n작업위치를 선택하세요.'));
  }

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<PalletViewModel>();
    viewCommon = context.watch<SettingInfoViewModel>();

    ownContext = context;

    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Padding(
          padding:
          const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
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
                              //await checkSyncStatus(context);

                              //showCustomSnackBarSuccess(
                              // context, '로케이션 번호를 읽히세요.');
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 40),
                              primary: Colors.teal[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: AutoSizeText(
                              _readWareHouseNm,
                              style: const TextStyle(
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
                              // //서버 동기화 체크
                              // await checkSyncStatus(context);
                              //
                              // //해당버튼을 누르면 창고위치로 값을 넘겨준다
                              // showCustomSnackBarSuccess(
                              //     context, '창고 QR을 입력하세요.');
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(70, 40),
                              primary: Colors.teal[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const AutoSizeText(
                              '1',
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
                  columns: getTopGridColumns(),
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
                  mode: PlutoGridMode.select,
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
                  deletePackedPallet(),
                }
              else if (index == 2)
                  {
                    Future.delayed(const Duration(seconds: 1), () async {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      Navigator.pop(context);
                    })
                  }
            }));
  }

  void deletePackedPallet() async {
    bool bRet = await _deletePackItem(
        context, downGridStateManager, _readWorkShop, _readLocation);
    if (bRet) {
      viewTopList();
      viewBottomList();
    }
  }

  // 리딩한 작업내용을 아래 그리드에 추가함
  // 값 파싱->임시저장 -> 재조회
  void _changeReadQrData(String sQrData) async {
    TbWhPallet? pallet = await viewModel.useCasesWms
        .scanQrCode(sQrData, _readWorkShop, _readLocation);

    if (pallet == null) {
      showCustomSnackBarWarn(context, gErrorMsg);
      return;
    }
    if (_readLocation.isEmpty) {
      showCustomSnackBarWarn(context, '로케이션을 먼저 스캔하세요.');
      return;
    }

    //qr 실적에서 창고코드 조회 후 체크
    TbWhItem tbWhItem = TbWhItem(comps: gComps, itemNo: pallet.itemNo);
    Result resultItem =
    await viewCommon.useCaseTbWhItem.selectTbWhItem(tbWhItem);
    resultItem.when(success: (value) async {
      TbWhItem retWhItem = value;
      pallet = pallet!.copyWith(arrival: retWhItem.warehouseCd);
    }, error: (message) {
      showCustomSnackBarWarn(context, message);
      return message;
    });

    //입력값 체킄
    if (await checkValueAdd(context, pallet) == false) {
      // for(TbWhPallet item in await getSendRow()){
      //   print(item);
      // }
      return;
    }

    //추가시 validation 은 repository 내부에있음
    Result result = await viewModel.useCasesWms.addPallet(pallet!);
    result.when(
        success: (value) {
          _viewAll();
        },
        error: (message) {});
  }

  void _clearData() {
    setState(() {
      _readWareHouse = '';
      _readWareHouseNm = '실적없음';
    });
  }

  //체크로직, 완료, 삭제 시
  Future<bool> checkValueAdd(BuildContext context, TbWhPallet? pallet) async {
    bool bRet = false;

    if (pallet == null) {
      return false;
    }

    Result result = await viewModel.useCasesWms.selectCheckValue(pallet);
    result.when(success: (value) {
      bRet = true;
      return true;
    }, error: (message) {
      showCustomSnackBarWarn(context, message);
      bRet = false;
      return false;
    });

    return bRet;
  }

  //상단 리스트 조회
  void viewTopList() {
    createPackingTopGridView(
      topGridStateManager,
      _readWorkShop,
      _readLocation,
    );
  }

  //하단 리스트 조회
  void viewBottomList() {
    createPackingButtomGridView(
      downGridStateManager,
      _readWorkShop,
      _readLocation,
    );
  }

  //
  // 저장
  // void _changeWorkshop(String sWorkShop) {
  //   setState(() {
  //
  //     _readWorkShop = sWorkShop;
  //
  //     viewBottomList();
  //   });
  // }

  //창고QR 리딩
  void _changeLocation(String sReadLocation) {
    setState(() {
      _readLocation = sReadLocation;
    });

    viewTopList();
    viewBottomList();
  }

  void _viewAll() {
    viewTopList();
    viewBottomList();
  }

  // 작업중인 내용 확정 처리
  // 확정 후 확정 리스트 서버로 송신
  Future<bool> confirmPacking() async {
    if (await _checkValue(context, 'CONFIRM', downGridStateManager, '') ==
        false) {
      return false;
    }

    // 서버로 전송 및 로컬디비 데이터 수정
    // 2022-07-01 | 서버로 전송하지 않고, 상태만 변경한다.
    // 2022-07-02 | 서버롤 전송하고 전송한 데이터는 삭제한다.
    List<TbWhPallet> sendList = await getSendRow();

    Result result =
    await viewModel.useCasesWms.confirmPalletFinishUseCase(sendList);

    result.when(success: (value) async {
      showCustomSnackBarSuccess(ownContext, gSuccessMsg);

      // 처리후 비동기 호출 추가
      WidgetsBinding.instance.addPostFrameCallback((_) => _viewAll());
    }, error: (message) {
      showCustomSnackBarWarn(ownContext, message);
      return false;
    });

    return true;
  }

  //상태를 2 로변경한다.
  //화면에서가 아닌 데이터 조회 후 전송한다.
  Future<List<TbWhPallet>> getSendRow() async {
    List<TbWhPallet> tbWhPallets = [];
    for (PlutoRow row in downGridStateManager.rows) {
      List<PlutoCell> cells = row.cells.values.toList();
      TbWhPallet newItem = TbWhPallet(
        comps: gComps,
        workshop: _readWorkShop,
        location: _readLocation,
        palletSeq: cells[0].value,
        itemNo: cells[1].value,
        itemLot: cells[2].value,
        boxNo: cells[3].value,
        quantity: cells[4].value,
        barcode: cells[5].value,
        state: '02',
      );

      tbWhPallets.add(newItem);
    }

    return tbWhPallets;
  }

  //최초로딩시 콤보박스 세팅
  //데이터가 없는 경우 하단 알람 창에 메세지 전시
  Future<void> setWorkshopList() async {
    List<ComboValueType> comboList = await getWorkshopComboValueList(context);
    String? sDefaultLocation = await palletCommonGetDefaultWorkShop(context);

    setState(() {
      _dataWorkshop = comboList;
      _readWorkShop = sDefaultLocation!;
      if (sDefaultLocation != null) {
        _readWorkShop = sDefaultLocation;
      }

      if (sDefaultLocation == '') {
        showCustomSnackBarSuccess(context, '로케이션을 스캔하세요.');
      }
    });
  }

  //로케이션 리스트를 불러온다.
  Future<void> setLocationList() async {
    List<ComboValueType> comboList = await getLocationComboValueList(context);
    setState(() {
      _dataLocation = comboList;
    });
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
                    viewTopList();
                    viewBottomList();
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

                    viewTopList();
                    viewBottomList();
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
    PointmobileScanner.disableBeep();
    // PointmobileScanner.enableBeep();
    //PointmobileScanner.triggerOn();

    PointmobileScanner.enableSymbology(PointmobileScanner.SYM_CODE128);
    PointmobileScanner.enableSymbology(PointmobileScanner.SYM_EAN13);
    PointmobileScanner.enableSymbology(PointmobileScanner.SYM_QR);
    PointmobileScanner.enableSymbology(PointmobileScanner.SYM_UPCA);
  }

  //바코드 관련 이벤트 및 함수 선언부분
  Future<void> _onBarcodeScannerHandler(MethodCall call) async {
    //공장코드 미설정 시 작업장 화면에서 설정하도록 할것
    // if (gComps.isEmpty) {
    //   showAlertDialog(context, '(진행불가) 공장 정보 미설정. \r\n 작업장 설정 화면에서 설정필요 ');
    //   return;
    // }
// print('gbTriggerOn : $gbTriggerOn');
//     if(gbTriggerOn == true){
//       gbTriggerOn = false;
//       PointmobileScanner.triggerOff();
//     }else{
//       PointmobileScanner.triggerOn();
//       gbTriggerOn = true;
//     }

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
  void _onDecode(MethodCall call) async {
    final List lDecodeResult = call.arguments;
    String? sVal = lDecodeResult[1];

    if (sVal == 'READ_FAIL') {
      // 2022-07-12 | 요청사항 바코드 읽기 실패해도 무시하도록 수정
      //showCustomSnackBarWarn(context, '(바코드 읽기 실패)');
      // PointmobileScanner.triggerOn();
      return;
    }

    //로케이션번호일경우
    //TAG 리스트 스캔시 해당분기로 빠지는걸 방지
    if (sVal != null && sVal.length < 4 && sVal.substring(0, 1) == 'L') {
      //Location
      _readLocation = sVal;
      _clearData();
      _changeLocation(_readLocation);

      playScanOkSound();
    } else if (sVal != null && sVal.length > 100) {
      //제품 QR
      _readQRData = sVal;
      // 실적 추가 후 품번에 대한 로케이션 정보를 불러온다.
      _changeReadQrData(_readQRData);

      playScanOkSound();
    } else {
      showCustomSnackBarWarn(context, '스캔한 작업 코드가 부적절합니다.');
    }
  }

  void _onError(Exception error) {
    setState(() {
      _decodeResult = error.toString();
    });
  }
  //
  // void _onExit() {
  //   PointmobileScanner.disableScanner();
  //   Navigator.pop(context);
  // }

  // 파싱된 품번을 이용해서 창고정보를 설정한다.
  // 1. 품번으로  창코위치와 location 정보를 가져와야함
  // 2. 창고 코드로 공통정보 조회 후 설정한다
  Future<bool> _changeWareHouse(
      BuildContext context, TbWhPallet? pallet) async {
    bool bRet = false;
    String sMsg = '';

    TbWhItem tbWhItem = TbWhItem(comps: gComps, itemNo: pallet!.itemNo);
    Result resultItem =
    await viewCommon.useCaseTbWhItem.selectTbWhItem(tbWhItem);

    resultItem.when(success: (value) async {
      TbWhItem item = value;
      Result result = await _getWarehouseInfo(item.warehouseCd!);

      result.when(success: (wareHouseInfo) async {
        TbWhCmCode retInfo = wareHouseInfo;
        setState(() {
          if (retInfo != null) {
            _readWareHouse = retInfo.codeCd!;
            _readWareHouseNm = retInfo.codeKoNm!;
          }
        });
      }, error: (message) {
        showCustomSnackBarWarn(context, sMsg);
      });
    }, error: (message) async {
      showCustomSnackBarWarn(context, sMsg);
      bRet = false;
    });

    return bRet;
  }

  Future<Result<TbWhCmCode>> _getWarehouseInfo(String sWarehouseCd) async {
    bool bRet = false;
    // 창고명 조회
    String sMsg = '';
    late TbWhCmCode ret;
    TbWhCmCode tbWhCmCode =
    TbWhCmCode(comps: gComps, grpCd: 'ARRIVAL', codeCd: sWarehouseCd);
    Result result = await viewCommon.useCaseCommonInfo
        .selectTbWhCmCodeListByCodeCd(tbWhCmCode);

    result.when(success: (value) async {
      List<TbWhCmCode> retList = value;
      if (retList.isNotEmpty) {
        bRet = true;
        ret = retList[0];
      }
    }, error: (message) async {
      bRet = false;
      sMsg = message;
    });

    if (bRet) {
      return Result.success(ret);
    } else {
      return Result.error(sMsg);
    }
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
    showCustomSnackBarSuccess(context, gSuccessMsg);

    return true;
  }

//체크로직, 완료, 삭제 시
  Future<bool> _checkValue(
      BuildContext context,
      String sConfirm,
      PlutoGridStateManager gridStateManager,
      String sQrCode,
      ) async {
    // int nCheckedItemCnt = 0;

    switch (sConfirm) {
      case 'READ_QR':
        if (sQrCode.length < gAvailableQrLength) {
          showCustomSnackBarWarn(context, '입력가능한 식별표가 아닙니다. 식별표를 확인하세요..');
          return false;
        }
        break;

      case 'CONFIRM':
      // if(await tryConnectionWithPopup(context) == false){
      //   return false;
      // }
        if (gridStateManager.rows.isEmpty) {
          showCustomSnackBarWarn(context, '완료 처리 할 항목이 없습니다.');
          return false;
        }
        if (await showAlertDialogQ(
          context,
          '확인',
          '작업 중인 내용을 완료처리 하시겠습니까?',
        ) ==
            false) {
          return false;
        }
        break;

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

// 01. 실적 입력화면
// 작업위치, 창고별 조회, 그루핑
// 조회되는 상태 :  packing, 완료항목
  Future<void> createPackingTopGridView(PlutoGridStateManager gridStateManager,
      String sWareHouse, String sLocation) async {
    //초기화
    PalletViewModel viewModel = context.read<PalletViewModel>();
    gridStateManager.rows.clear();
    gridStateManager.removeRows(gridStateManager.rows);
    //조회

    List<TbWhPalletGroup>? pallets = await viewModel.useCasesWms
        .selectPackingSummaryUseCase(gComps, sWareHouse, sLocation);
    if (pallets != null) {
      gridStateManager.appendRows(
        getPackTopGridRowsGrouping(pallets),
      );

      if (gridStateManager.rows.length == 1) {
        //데이터가 없습니다는 한군데에서만
        // showCustomSnackBarSuccess(context, '입력 중인 데이터가 없습니다.');
      }

      gridStateManager.notifyListeners();
    }
  }

  Future<void> createPackingButtomGridView(
      PlutoGridStateManager gridStateManager,
      String sWareHouse,
      String sLocation) async {
    PalletViewModel viewModel = context.read<PalletViewModel>();
    gridStateManager.rows.clear();
    gridStateManager.removeRows(gridStateManager.rows);

    //조회
    List<TbWhPallet>? pallets = await viewModel.useCasesWms
        .selectPackingListUseCase(sWareHouse, sLocation);

    if (pallets != null && pallets.isNotEmpty) {
      gridStateManager.appendRows(
        getPackButtomGridRows(pallets),
      );
      gridStateManager.notifyListeners();

      //창고 코드 설정
      _changeWareHouse(context, pallets[0]);

      if (gridStateManager.rows.length == 1) {
        //데이터가 없습니다는 한군데에서만
        // showCustomSnackBarSuccess(context, '입력 중인 데이터가 없습니다.');
      }
    }
  }
}

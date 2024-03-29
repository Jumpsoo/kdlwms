import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_common_function.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:kdlwms/presentation/pallet/sub_functions/pallet_printing_label_functions.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pointmobile_scanner/pointmobile_scanner.dart';
import 'package:provider/provider.dart';

class PalletPrintingLabelPage extends StatefulWidget {
  final String title;

  const PalletPrintingLabelPage({Key? key, required this.title})
      : super(key: key);

  @override
  State<PalletPrintingLabelPage> createState() =>
      _PalletPrintingLabelPageState();
}

class _PalletPrintingLabelPageState extends State<PalletPrintingLabelPage> {
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

  String _readWareHouseNm = '';

  // QR 리딩값 분기용 변수 2개

  String _readQRData = "";
  final _controller = TextEditingController();

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
      _readWareHouseNm = '실적없음';

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
                          // child: AutoSizeText(
                          //   _readWareHouseNm,
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
              height: 400,
              child: PlutoGrid(
                columns: getPrintItemColumns(),
                mode: PlutoGridMode.select,
                rows: [],
                // columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  topGridStateManager = event.stateManager;
                  // viewPrintingList(
                  //   context,
                  //   topGridStateManager,
                  // );
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
              icon: Icon(Icons.print_outlined),
              label: '발행',
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
                    viewPrintingList(
                      context,
                      topGridStateManager,
                    ),
                  }
                else if (index == 1)
                  {
                    //인쇄요청 ( 벡엔드 : 팔레트 생성,인쇄처리)
                    pringtingPalletList(
                      context,
                      topGridStateManager,
                    ),
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

  //창고QR 리딩
  void _changeLocation(String sReadLocation) {
    setState(() {
      _readLocation = sReadLocation;
    });
    viewPrintingList(
      context,
      topGridStateManager,
    );
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

    });
  }

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
                    viewPrintingList(
                      context,
                      topGridStateManager,
                    );
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
                    viewPrintingList(
                      context,
                      topGridStateManager,
                    );
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
    _controller.dispose();
    super.dispose();
  }

  //스캐너 모듈 초기화
  void setBarcodeScanner() {
    PointmobileScanner.channel.setMethodCallHandler(_onBarcodeScannerHandler);
    PointmobileScanner.initScanner();
    PointmobileScanner.enableScanner();
    PointmobileScanner.enableBeep();

    // PointmobileScanner.enableBeep();

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
    print('1111');
    try {
      if (call.method == PointmobileScanner.ON_DECODE) {
        print('222');
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

  // (중요) 바코드 읽혔을 때 처리 이벤트
  void _onDecode(MethodCall call) {
    final List lDecodeResult = call.arguments;
    print(lDecodeResult);
    String? sVal = lDecodeResult[1];

    if (sVal == 'READ_FAIL') {
      // showCustomSnackBarWarn(context, '(바코드 읽기 실패)');
      return;
    }

    //로케이션번호일경우
    //TAG 리스트 스캔시 해당분기로 빠지는걸 방지
    if (sVal != null && sVal.length < 4 && sVal.substring(0, 1) == 'L') {
      //Location
      _readLocation = sVal;
      _changeLocation(_readLocation);
    } else {
      showCustomSnackBarWarn(context, '스캔한 작업 코드가 부적절합니다.');
    }
  }

  void _onError(Exception error) {
    setState(() {
      _decodeResult = error.toString();
    });
  }

//선택된 항목 인쇄
  Future<bool> pringtingPalletList(
    BuildContext context,
    PlutoGridStateManager gridStateManager,
  ) async {
    if (await _checkValue(context, 'PRINT', gridStateManager, '') == false) {
      return false;
    }

    bool bRet = false;
    String sMsg= '';

    PalletViewModel viewModel = context.read<PalletViewModel>();
    List<TbWhPalletPrint> printingList = [];

    PlutoRow row = gridStateManager.currentCell!.row;
    List<PlutoCell> cells = row.cells.values.toList();
    printingList.add(TbWhPalletPrint(
      comps: gComps,
      workshop: _readWorkShop,
      printFlag: cells[0].value,
      palletDate: DateFormat('yyyy-MM-dd HH:mm:ss').parse(cells[1].value),
      palletSeq: cells[2].value,
      departure: cells[3].value,
      arrival: cells[4].value,
      total: cells[5].value,
    ));
    // }

    if (printingList.isEmpty) {
      showCustomSnackBarWarn(context, '인쇄할 내용이 없습니다');
      return false;
    }

    //라벨전송
    Result result =
        await viewModel.useCasesWms.printingPalletUseCase(printingList);
    result.when(success: (value) {

      showCustomSnackBarSuccess(context, gSuccessMsg, true);

      viewPrintingList(
        context,
        topGridStateManager,
      );
    }, error: (message) {
      showCustomSnackBarWarn(context, message);
    });

    return true;
  }

  //인쇄 대상 조회
  //서버에서 불러온다.
  Future<void> viewPrintingList(
      BuildContext context, PlutoGridStateManager gridStateManager) async {
    //초기화
    PalletViewModel viewModel = context.read<PalletViewModel>();
    gridStateManager.rows.clear();
    gridStateManager.removeRows(gridStateManager.rows);

    Result result = await viewModel.useCasesWms
        .selectPrintingList(gComps, _readWorkShop, _readLocation, '');

    result.when(success: (valueList) {

      List<TbWhPalletPrint> pallets = valueList;
      if (pallets.isEmpty) {
        showCustomSnackBarSuccess(context, '해당 작업위치에 입력 완료한 실적이 없습니다.', false);
      } else {

        gridStateManager.appendRows(getPrintGridRowsGroup(pallets));
        gridStateManager.notifyListeners();

        if(pallets.isEmpty) {
          setState(() {
            _readWareHouseNm = pallets[0].arrival == null ? ''  :  pallets[0].arrival!;
          });
        }
      }
    }, error: (message) {
      showCustomSnackBarWarn(context, message);
    });
  }

//체크로직, 완료, 삭제 시
  Future<bool> _checkValue(BuildContext context, String confirm,
      PlutoGridStateManager gridStateManager, String sQrCode) async {
    switch (confirm) {
      case 'PRINT':
        //인터넷 접속 확인
        if (await tryConnectionWithPopup(context) == false) {
          return false;
        }
        if (gridStateManager.currentRow == null) {
          showCustomSnackBarWarn(context, '선택된 항목이 없습니다.');
          return false;
        }

        if (gridStateManager.rows.isEmpty) {
          showCustomSnackBarWarn(context, '인쇄할 항목이 없습니다.');
          return false;
        }

        if (await showAlertDialogQ(
              context,
              '확인',
              '선택 한 내용을 인쇄 하시겠습니까?',
            ) ==
            false) {
          return false;
        }

        break;
    }
    return true;
  }
}

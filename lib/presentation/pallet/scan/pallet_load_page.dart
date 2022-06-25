import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_common_function.dart';
import 'package:provider/provider.dart';

import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:kdlwms/presentation/pallet/components/pack_grid_top.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';

class PalletLoadPage extends StatefulWidget {
  final String title;

  const PalletLoadPage({Key? key, required this.title}) : super(key: key);

  @override
  State<PalletLoadPage> createState() => _PalletLoadPageState();
}

class _PalletLoadPageState extends State<PalletLoadPage> {
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

  //콤보박스용 변수
  String? _selectedWorkshopValue = 'A';
  String? _selectedLocationValue = 'A';
  List<ComboValueType> _dataWorkshop = [];
  List<ComboValueType> _dataLocation = [];

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
    //작업장 불러오기
    setWorkshopList();

    setLocationList();

    hideCircularProgressIndicator();
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
                          padding:
                          const EdgeInsets.only(left: 5, right: 5),
                          width: 200,
                          height: 40,
                          alignment: Alignment.centerLeft,
                          child: createLocationDropDownButton(
                            _dataLocation,
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
                        _selectedValue ?? "", _readLocation, LoadState.Confirm.index);
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
                        _readLocation,
                    LoadState.Confirm.index,);
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
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '조회',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_airport),
              label: '상차 완료',
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
                loadPacking(),
              }
            else if (index == 2)
                {
                  //종료
                  Future.delayed(const Duration(milliseconds: 500), () async {
                     ScaffoldMessenger.of(context).clearSnackBars();
                    Navigator.pop(context);
                  }),
                }
          }),);
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
            context, topGridStateManager, _readWorkShop, _readLocation,LoadState.Confirm.index);
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
          context, packGridStateManager, _readWorkShop, _readLocation, LoadState.Load.index);
    });
  }

  Future<void> viewAll(String sWareHouse, String sLocation) async {
    palletCommonViewTopList(
        context, topGridStateManager, sWareHouse, sLocation, LoadState.Confirm.index);

    palletCommonViewBottomList(
        context, packGridStateManager, sWareHouse, sLocation, LoadState.Load.index);
  }

  // 작업중인 내용 확정 처리
  // 확정 후 확정 리스트 서버로 송신
  void loadPacking() async {
    if (await checkValue(context, 'LOAD', topGridStateManager, '') ==
        false) {
      return;
    }
    //상태를 3 로변경한다.
    //화면에서가 아닌 데이터 조회 후 전송한다.
    List<TbWhPallet> tbWhPallets = [];
    for (PlutoRow row in topGridStateManager.rows) {
      if (row.checked == true) {
        List<PlutoCell> cells = row.cells.values.toList();
        tbWhPallets.add(TbWhPallet(
            comps: gComps, palletSeq: cells[1].value, itemNo: cells[2].value, itemLot: cells[3].value, quantity: cells[4].value, boxNo: cells[5].value));
      }
    }
    // 서버로 전송 및 로컬디비 데이터 수정
    await viewModel.useCasesWms.updatePalletFinishUseCase(tbWhPallets, LoadState.Load.index);

    showCustomSnackBarSuccess(ownContext, '정상처리 되었습니다.');
    await viewAll(_readWorkShop, _readLocation);
  }

  //최초로딩시 콤보박스 세팅
  //데이터가 없는 경우 하단 알람 창에 메세지 전시
  Future<void> setWorkshopList() async {
    List<ComboValueType> comboList =
    await getWorkshopComboValueList(context);
    String? sDefaultLocation = await palletCommonGetDefaultWorkShop(context);

    setState(() {
      _datas = comboList;

      _selectedValue = sDefaultLocation;
      _readWorkShop = sDefaultLocation!;

      if (sDefaultLocation != null) {
        _readWorkShop = sDefaultLocation;
        viewAll(_readWorkShop, _readLocation);
      }

      if(sDefaultLocation == ''){
        showCustomSnackBarWarn(context, '작업위치 설정되지 않았습니다.');
      }

    });
  }

  Future<void> setLocationList() async {
    List<ComboValueType> comboList = await getLocationComboValueList(context);

    setState(() {
      _dataLocation = comboList;
      _selectedLocationValue = '';
    });
  }
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
              iconSize: 20,
              elevation: 15,
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
              iconSize: 20,
              elevation: 15,
              value: _selectedLocationValue,
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedLocationValue = newValue;
                    _readLocation = newValue;
                    viewAll(_readWorkShop, _selectedLocationValue ?? '');
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
  void dispose() async {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

}
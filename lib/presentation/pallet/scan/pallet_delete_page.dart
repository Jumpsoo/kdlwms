import 'dart:async';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_common_function.dart';
import 'package:kdlwms/presentation/pallet/sub_functions/pallet_delete_functions.dart';
import 'package:provider/provider.dart';

import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';

class PalletDeletePage extends StatefulWidget {
  final String title;

  const PalletDeletePage({Key? key, required this.title}) : super(key: key);

  @override
  State<PalletDeletePage> createState() => _PalletDeletePageState();
}

class _PalletDeletePageState extends State<PalletDeletePage> {
  late BuildContext ownContext;

  static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;

  StreamSubscription? _subscription;

  //Data 조회용
  final List<TbWhPallet> pallets = [];
  List<PlutoRow> topGridRows = [];

  late PalletViewModel viewModel;
  late SettingInfoViewModel viewModelShop;

  late final PlutoGridStateManager mainGridStateManager;

  @override
  // init에는 watch 사용 금지
  void initState() {
    super.initState();

    setState(() {});

    //프로그래스바
    hideCircularProgressIndicator();

    WidgetsBinding.instance.addPostFrameCallback((_) =>
        showCustomSnackBarSuccess(
            context, '삭제할 항목을 선택하고, \r\n삭제 버튼을 터치하거나 전체삭제 터치'));
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
            //하단그리드

            // Container(
            //   height: 180,
            //   child: PlutoGrid(
            //     columns: getLoadTopGridColumns(),
            //     mode: PlutoGridMode.select,
            //     rows: [],
            //     // columnGroups: columnGroups,
            //     onLoaded: (PlutoGridOnLoadedEvent event) {
            //       topGridStateManager = event.stateManager;
            //       viewTopList();
            //     },
            //     onChanged: (PlutoGridOnChangedEvent event) {
            //       //to do
            //     },
            //     configuration: getGridStyle1(),
            //   ),
            // ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              height: 450,
              child: PlutoGrid(
                columns: getDeleteGridColumns(),
                rows: [],
                // columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  mainGridStateManager = event.stateManager;
                  viewMain(true);
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
              icon: Icon(Icons.delete_forever_rounded),
              label: '선택 삭제',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete_sweep_outlined),
              label: '전체 삭제',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: '전화면',
            ),
          ],
          onTap: (index) => {
                if (index == 0)
                  {
                    //선택삭제
                    deleteSelectedPallet(),
                  }
                else if (index == 1)
                  {
                    //처리후 삭제
                    deleteAllPallet(),
                  }
                else if (index == 2)
                  {
                    //종료
                    Future.delayed(const Duration(milliseconds: 500), () async {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      Navigator.pop(context);
                    }),
                  }
              }),
    );
  }

  // 적재중(완료처리전) 입력된 대상을 삭제한다 , 선택삭제
  void deleteSelectedPallet() async {
    if (await _checkValue(context, 'DELETE', mainGridStateManager, '') ==
        false) {
      return;
    }
    //선택된 행
    PlutoRow row = mainGridStateManager.currentCell!.row;
    List<PlutoCell> cells = row.cells.values.toList();

    List<TbWhPalletForDelete> loadingList = [];
    loadingList.add(TbWhPalletForDelete(
      comps: cells[0].value,
      location: cells[1].value,
      arrival: cells[2].value,
    ));

    // 서버로 전송 및 로컬디비 데이터 수정
    // 데이터 삭제
    Result result = await viewModel.useCasesWms
        .deleteTbWhPalletByLocationUseCase(loadingList);
    result.when(success: (value) {
      showCustomSnackBarSuccess(ownContext, gSuccessMsg);
    }, error: (message) {
      showCustomSnackBarWarn(context, message);
    });
    // 처리후 비동기 호출 추가
    WidgetsBinding.instance.addPostFrameCallback((_) => viewMain(false));
  }

  // 적재중(완료처리전) 입력된 대상을 삭제한다 , 전체삭제
  void deleteAllPallet() async {
    if (await _checkValue(context, 'DELETE_ALL', mainGridStateManager, '') ==
        false) {
      return;
    }

    List<TbWhPalletForDelete> loadingList = [];
    for (PlutoRow row in mainGridStateManager.rows) {
      List<PlutoCell> cells = row.cells.values.toList();
      loadingList.add(TbWhPalletForDelete(
        comps: cells[0].value,
        location: cells[1].value,
        arrival: cells[2].value,
      ));
    }

    // 서버로 전송 및 로컬디비 데이터 수정
    // 데이터 삭제
    Result result = await viewModel.useCasesWms
        .deleteTbWhPalletByLocationUseCase(loadingList);
    result.when(success: (value) {
      showCustomSnackBarSuccess(ownContext, gSuccessMsg);
    }, error: (message) {
      showCustomSnackBarWarn(context, message);
    });
    // 처리후 비동기 호출 추가
    WidgetsBinding.instance.addPostFrameCallback((_) => viewMain(false));
  }

  //하단 리스트 조회
  // isMsg : 데이터 없음 메시지를 보여줄지 선택
  void viewMain(bool isMsg) {
    createDeleteButtomGridView(context, mainGridStateManager, isMsg);
  }

//체크로직, 완료, 삭제 시
  Future<bool> _checkValue(
    BuildContext context,
    String sGbn,
    PlutoGridStateManager gridStateManager,
    String sQrCode,
  ) async {
    int nCheckedItemCnt = 0;

    switch (sGbn) {
      case 'DELETE':
        if (gridStateManager.currentCell == null) {
          showCustomSnackBarWarn(context, '삭제 할 항목을 선택하세요.');
          return false;
        }
        if (gridStateManager.rows.isEmpty) {
          showCustomSnackBarWarn(context, '삭제 할 항목이 없습니다.');
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

      case 'DELETE_ALL':
        if (gridStateManager.rows.isEmpty) {
          showCustomSnackBarWarn(context, '삭제 할 항목이 없습니다.');
          return false;
        }
        if (await showAlertDialogQ(
              context,
              '확인',
              '작업 중인 내용을 전체 삭제 하시겠습니까?',
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
    super.dispose();
  }
}

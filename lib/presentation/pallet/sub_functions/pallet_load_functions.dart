
// 04. 상차완료 세부 함수
import 'package:flutter/material.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';

import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';


// 04. 상차화면 조회
//작업위치, 창고별 조회, 그루핑
// 리스트 초기화 -> 데이터 조회 -> 바인딩
// 상태 : 완료, 상차완료 만 조회됨
Future<void> createLoadingTopGridView(
    BuildContext context,
    PlutoGridStateManager gridStateManager,
    String sWareHouse,
    String sLocation ) async {
  //초기화
  PalletViewModel viewModel = context.read<PalletViewModel>();
  gridStateManager.rows.clear();
  gridStateManager.removeRows(gridStateManager.rows);
  //조회

  List<TbWhPalletGroup>? pallets =
  await viewModel.useCasesWms.selectLoadingSummaryUseCase(gComps, sWareHouse, sLocation);
  if (pallets != null){
    gridStateManager.appendRows(
      getLoadTopGridRowsGrouping(pallets),
    );
    gridStateManager.notifyListeners();
  }
}

Future<void> createLoadingButtomGridView(
    BuildContext context,
    PlutoGridStateManager gridStateManager,
    String sWareHouse,
    String sLocation ) async {
  //초기화
  PalletViewModel viewModel = context.read<PalletViewModel>();
  gridStateManager.rows.clear();
  gridStateManager.removeRows(gridStateManager.rows);
  //조회

  List<TbWhPallet>? pallets =
  await viewModel.useCasesWms.selectLoadingListUseCase(gComps, sWareHouse, sLocation);

  if (pallets == null) {
    showCustomSnackBarSuccess(context, '해당 작업위치에 입력완료한 실적이 없습니다.');
  } else {
    gridStateManager.appendRows(
      getLoadButtomGridRows(pallets),
    );

    if(gridStateManager.rows.length == 1){
      //데이터가 없습니다는 한군데에서만
      showCustomSnackBarWarn(context, '입력 중인 데이터가 없습니다. ');
    }
    gridStateManager.notifyListeners();
  }
}



// 상단 그리드 입력창용
// 컬럼 리스트 지정
// max => 180
List<PlutoColumn> getLoadTopGridColumns() {
  List<PlutoColumn> cols = <PlutoColumn>[

    PlutoColumn(
      title: 'SEQ',
      field: 'SEQ',
      width: 50,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.number(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: '품목 코드',
      field: 'itemNo',
      width: 120,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.left,
      enableColumnDrag: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: 'LOT',
      field: 'itemLot',
      width: 50,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.center,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: '수량',
      field: 'quantity',
      width: 60,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: 'Box',
      field: 'boxCnt',
      width: 60,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
  ];
  return cols;
}

// 상단 그리드
// 데이터 로우
List<PlutoRow> getLoadTopGridRows(List<TbWhPallet> pallets) {

  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;
  for (var e in pallets) {
    nRowNum = nRowNum + 1;
    PlutoRow row = PlutoRow(
      cells: {
        'SEQ' : PlutoCell(value: nRowNum),
        'itemNo': PlutoCell(value: e.itemNo),
        'itemLot': PlutoCell(value: e.itemLot),
        'palletSeq': PlutoCell(value: e.palletSeq),
        'quantity': PlutoCell(value: e.quantity),
        'boxNo': PlutoCell(value: e.boxNo),
      },
    );
    rows.add(row);
  }
  return rows;
}

// 상단 그리드
// 데이터 로우
List<PlutoRow> getLoadTopGridRowsGrouping(List<TbWhPalletGroup> pallets) {

  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;
  for (var e in pallets) {
    PlutoRow row = PlutoRow(
      cells: {
        'SEQ' : PlutoCell(value: nRowNum),
        'itemNo': PlutoCell(value: e.itemNo),
        'itemLot': PlutoCell(value: e.itemLot),
        'quantity': PlutoCell(value: e.quantity),
        'boxCnt': PlutoCell(value: e.boxCnt),
      },
    );
    nRowNum = nRowNum + 1;
    rows.add(row);
  }
  return rows;
}

// 하단그리드 입력창용
// 컬럼 리스트 지정
// max => 180
List<PlutoColumn> getPackGridColumns() {
  return <PlutoColumn>[
    // PlutoColumn(title: 'Id',field: 'id',type: PlutoColumnType.text(),),

    PlutoColumn(
      title: 'SEQ',
      field: 'palletSeq',
      width: 50,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.number(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: '품목 코드',
      field: 'itemNo',
      width: 120,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.left,
      enableColumnDrag: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: 'LOT',
      field: 'itemLot',
      width: 50,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.center,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: 'SEQNO',
      field: 'boxNo',
      width: 70,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: '수량',
      field: 'quantity',
      width: 50,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: 'QR',
      field: 'barcode',
      width: 0,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
  ];
}
// 하단 그리드
// 데이터 로우
List<PlutoRow> getLoadButtomGridRows(List<TbWhPallet> pallets) {
  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;
  try{

    int nRowNum = 0;
    for (var e in pallets) {
      nRowNum = nRowNum + 1;
      PlutoRow row = PlutoRow(
        cells: {
          'palletSeq' : PlutoCell(value: nRowNum),
          'itemNo': PlutoCell(value: e.itemNo),
          'itemLot': PlutoCell(value: e.itemLot),
          'quantity': PlutoCell(value: e.quantity),
          'boxNo': PlutoCell(value: e.boxNo),
          'barcode': PlutoCell(value: e.barcode),
        },
      );
      rows.add(row);
    }
  }catch(e){
    writeLog(e.toString());
  }
  return rows;
}

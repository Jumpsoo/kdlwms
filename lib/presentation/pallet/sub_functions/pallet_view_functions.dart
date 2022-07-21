// 01. 실적입력화면 세부 함수
import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';

import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

// 02.  실적 조회 화면
// 작업위치, 창고별 조회, 그루핑
// 상태무관하게 조회 : 상태, 품번, lot
Future<void> createPalletingTopGridView(
    BuildContext context,
    PlutoGridStateManager gridStateManager,
    String sWareHouse,
    String sLocation) async {
  //초기화
  PalletViewModel viewModel = context.read<PalletViewModel>();
  gridStateManager.rows.clear();
  gridStateManager.removeRows(gridStateManager.rows);
  //조회

  List<TbWhPalletGroup>? pallets = await viewModel.useCasesWms
      .selectPalletingSummaryUseCase(gComps, sWareHouse, sLocation);
  if (pallets != null) {
    List<PlutoRow> plutoRows = getViewTopGridRowsGrouping(pallets);
    if (plutoRows.isNotEmpty && plutoRows.length > 1) {
      gridStateManager.appendRows(plutoRows);
      gridStateManager.notifyListeners();
    }
  }
}

Future<void> createPalletingButtomGridView(
    BuildContext context,
    PlutoGridStateManager gridStateManager,
    String sWareHouse,
    String sLocation) async {
  //초기화
  PalletViewModel viewModel = context.read<PalletViewModel>();
  gridStateManager.rows.clear();
  gridStateManager.removeRows(gridStateManager.rows);
  //조회

  Result result = await viewModel.useCasesWms
      .selectPalletingListUseCase(gComps, sWareHouse, sLocation);
  result.when(success: (valueList) {
    List<TbWhPallet>? pallets = valueList;
    if (pallets == null) {
      showCustomSnackBarSuccess(context, '해당 작업위치에 입력완료한 실적이 없습니다.', false);
    } else {
      List<PlutoRow> plutoRows = getViewButtomGridRows(pallets);
      if (plutoRows.isNotEmpty && plutoRows.length > 1) {
        gridStateManager.appendRows(plutoRows);
        gridStateManager.notifyListeners();
      }
    }
  }, error: (message) {
    showCustomSnackBarWarn(context, message);
  });
}

// 상단 그리드 입력창용
// 컬럼 리스트 지정
// max => 180
List<PlutoColumn> getViewTopGridColumns() {
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
List<PlutoRow> getViewTopGridRows(List<TbWhPallet> pallets) {
  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;
  for (var e in pallets) {
    nRowNum = nRowNum + 1;
    PlutoRow row = PlutoRow(
      cells: {
        'SEQ': PlutoCell(value: nRowNum),
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
List<PlutoRow> getViewTopGridRowsGrouping(List<TbWhPalletGroup> pallets) {
  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;
  for (var e in pallets) {
    PlutoRow row = PlutoRow(
      cells: {
        'SEQ': PlutoCell(value: nRowNum),
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
List<PlutoRow> getViewButtomGridRows(List<TbWhPallet> pallets) {
  List<PlutoRow> rows = List.empty(growable: true);
  try {
    int nRowNum = 0;
    for (var e in pallets) {
      nRowNum = nRowNum + 1;
      PlutoRow row = PlutoRow(
        cells: {
          'palletSeq': PlutoCell(value: nRowNum),
          'itemNo': PlutoCell(value: e.itemNo),
          'itemLot': PlutoCell(value: e.itemLot),
          'quantity': PlutoCell(value: e.quantity),
          'boxNo': PlutoCell(value: e.boxNo),
          'barcode': PlutoCell(value: e.barcode),
        },
      );
      rows.add(row);
    }
  } catch (e) {
    writeLog(e.toString());
  }
  return rows;
}

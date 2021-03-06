// 01. 실적입력화면 세부 함수
import 'package:flutter/services.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';

import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pointmobile_scanner/pointmobile_scanner.dart';

// 상단 그리드 입력창용
// 컬럼 리스트 지정
// max => 180
List<PlutoColumn> getTopGridColumns() {
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
      width: 140,
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
List<PlutoRow> getPackTopGridRowsGrouping(List<TbWhPalletGroup> pallets) {
  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;

  try{
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
  }catch(e){
    writeLog(e.toString());
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
      width: 140,
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
List<PlutoRow> getPackButtomGridRows(List<TbWhPallet> pallets) {
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
          'boxNo': PlutoCell(value: e.boxNo),
          'quantity': PlutoCell(value: e.quantity),
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



Future<void> onNothing(MethodCall call) async {}

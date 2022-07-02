
import 'package:flutter/material.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:pluto_grid/pluto_grid.dart';

//03. 라벨인쇄 화면
// 상단 그리드 입력창용
// 컬럼 리스트 지정
// 상태무관하게 조회됨
List<PlutoColumn> getPrintItemColumns() {
  List<PlutoColumn> cols = <PlutoColumn>[
    // PlutoColumn(
    //   title: 'chk',
    //   field: 'check',
    //   width: 70,
    //   textAlign: PlutoColumnTextAlign.right,
    //   type: PlutoColumnType.text(),
    //   enableColumnDrag: false,
    //   enableContextMenu: false,
    //   enableEditingMode: false,
    //   enableRowChecked: true,
    // ),
    // PlutoColumn(
    //   title: '위치',
    //   field: 'location',
    //   width: 120,
    //   type: PlutoColumnType.text(),
    //   textAlign: PlutoColumnTextAlign.left,
    //   enableColumnDrag: false,
    //   enableContextMenu: false,
    // ),
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
      textAlign: PlutoColumnTextAlign.right,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      // enableRowChecked: true,
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
List<PlutoRow> getPrintGridRowsGroup(List<TbWhPalletGroup> pallets) {

  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;
  for (var e in pallets) {

    nRowNum = nRowNum + 1;
    PlutoRow row = PlutoRow(
      cells: {
        // 'check': PlutoCell(value: false),
        // 'SEQ': PlutoCell(value: nRowNum),
        'itemNo': PlutoCell(value: e.itemNo),
        'itemLot': PlutoCell(value: e.itemLot),
        'quantity': PlutoCell(value: e.quantity),
        'boxCnt': PlutoCell(value: e.boxCnt),
      },
    );
    rows.add(row);
  }
  return rows;
}

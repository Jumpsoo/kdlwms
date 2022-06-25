
import 'package:flutter/material.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:pluto_grid/pluto_grid.dart';

// 상단 그리드 입력창용
// 컬럼 리스트 지정
// max => 180
List<PlutoColumn> getPrintItemColumns() {
  List<PlutoColumn> cols = <PlutoColumn>[
    PlutoColumn(
      title: 'chk',
      field: 'check',
      width: 70,
      textAlign: PlutoColumnTextAlign.right,
      type: PlutoColumnType.number(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      enableRowChecked: true,
    ),
    PlutoColumn(
      title: '작업장',
      field: 'workshop',
      width: 100,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.left,
      enableColumnDrag: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: 'SEQ',
      field: 'palletSeq',
      width: 70,
      textAlign: PlutoColumnTextAlign.right,
      type: PlutoColumnType.number(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      // enableRowChecked: true,
    ),
    PlutoColumn(
      title: '창고',
      field: 'location',
      width: 70,
      textAlign: PlutoColumnTextAlign.right,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      // enableRowChecked: true,
    ),
  ];
  return cols;
}

// 상단 그리드
// 데이터 로우
List<PlutoRow> getPrintGridRows(List<TbWhPallet> pallets) {
  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;

  for (var e in pallets) {
    PlutoRow row = PlutoRow(
      cells: {
        'check': PlutoCell(value: 0),
        'workshop': PlutoCell(value: e.workshop),
        'palletSeq': PlutoCell(value: e.palletSeq),
        'location': PlutoCell(value: e.location),
        // 'scanDate' : PlutoCell(value: e.scanDate),
      },
    );
    rows.add(row);
  }
  return rows;
}

PlutoGridConfiguration getGridStyle1() {
  return const PlutoGridConfiguration(
    enterKeyAction: PlutoGridEnterKeyAction.none,
    enableColumnBorder: true,
    rowHeight: 30,
    columnHeight: 30,
    scrollbarConfig: PlutoGridScrollbarConfig(isAlwaysShown: true, scrollbarThickness: 5),
    cellTextStyle: TextStyle(fontSize: 12)
  );
}

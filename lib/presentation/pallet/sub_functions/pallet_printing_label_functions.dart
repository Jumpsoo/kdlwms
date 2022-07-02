
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet_print.dart';
import 'package:pluto_grid/pluto_grid.dart';

//03. 라벨인쇄 화면
// 상단 그리드 입력창용
// 컬럼 리스트 지정
// 상태무관하게 조회됨
List<PlutoColumn> getPrintItemColumns() {
  List<PlutoColumn> cols = <PlutoColumn>[


    PlutoColumn(
      title: '발행',
      field: 'printFlag',
      width: 60,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.center,
      enableColumnDrag: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '적재시간',
      field: 'palletDate',
      width: 150,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      // enableRowChecked: true,
    ),
    PlutoColumn(
      title: 'SEQ',
      field: 'palletSeq',
      width: 50,
      textAlign: PlutoColumnTextAlign.right,
      type: PlutoColumnType.number(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      // enableRowChecked: true,
    ),
     PlutoColumn(
      title: '출발지',
      field: 'departure',
      width: 70,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: '도착지',
      field: 'arrival',
      width: 70,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: 'TOTAL',
      field: 'total',
      width: 70,
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
List<PlutoRow> getPrintGridRowsGroup(List<TbWhPalletPrint> pallets) {

  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;
  for (var e in pallets) {

    nRowNum = nRowNum + 1;
    PlutoRow row = PlutoRow(
      cells: {
        'printFlag' :PlutoCell(value: e.printFlag),
        'palletDate' :PlutoCell(value: DateFormat('yyyy-MM-dd HH:mm:ss').format(e.palletDate!)),
        'palletSeq': PlutoCell(value: e.palletSeq),
        'departure': PlutoCell(value: e.departure),
        'arrival': PlutoCell(value: e.arrival),
        'total': PlutoCell(value: e.total),
      },
    );
    rows.add(row);
  }
  return rows;
}

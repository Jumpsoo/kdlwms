import 'package:flutter/material.dart';
import 'package:kdlwms/domain/model/pallet.dart';
import 'package:pluto_grid/pluto_grid.dart';


// 컬럼 리스트 지정
// max => 360
List<PlutoColumn> getPackGridColumns() {
  return <PlutoColumn>[
    // PlutoColumn(title: 'Id',field: 'id',type: PlutoColumnType.text(),),
    PlutoColumn(
      title: 'SEQ',
      field: 'PALLET_SEQ',
      width: 30,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: '품목 코드',
      field: 'ITEM_NO',
      width: 180,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.left,
    ),
    PlutoColumn(
      title: 'LOT',
      field: 'ITEM_LOT',
      width: 70,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.left,
    ),
    PlutoColumn(
      title: '수량',
      field: 'QUANTITY',
      width: 50,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
    ),
    PlutoColumn(
      title: 'Box',
      field: 'BOX_NO',
      width: 50,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
    ),
  ];
}

// 데이터 로우
List<PlutoRow> getPackGridRows(List<Pallet> pallets) {
  List<PlutoRow> rows = List.empty(growable: true);

  for (var e in pallets) {
    PlutoRow row = PlutoRow(
      cells: {
        'PALLET_SEQ': PlutoCell(value: e.PALLET_SEQ),
        'ITEM_NO': PlutoCell(value: e.ITEM_NO),
        'ITEM_LOT': PlutoCell(value: e.ITEM_LOT),
        'QUANTITY': PlutoCell(value: e.QUANTITY),
        'BOX_NO': PlutoCell(value: e.BOX_NO),
      },
    );

    rows.add(row);
  }
  return rows;
}
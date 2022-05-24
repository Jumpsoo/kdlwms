import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:pluto_grid/pluto_grid.dart';


// 상단 그리드 입력창용
// 컬럼 리스트 지정
// max => 180
List<PlutoColumn> getTopGridColumns() {
  return <PlutoColumn>[
    // PlutoColumn(title: 'Id',field: 'id',type: PlutoColumnType.text(),),
    PlutoColumn(
      title: 'SEQ',
      field: 'SEQ',
      width: 50,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: '품목 코드',
      field: 'ITEM_NO',
      width: 150,
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
      width: 0,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
    ),
    PlutoColumn(
      title: 'SEQNO',
      field: 'PALLET_SEQ',
      width: 0,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
    ),
  ];
}

// 상단 그리드
// 데이터 로우
List<PlutoRow> getTopGridRows(List<TbWhPallet> pallets) {
  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;
  for (var e in pallets) {
    nRowNum = nRowNum + 1;
    PlutoRow row = PlutoRow(
      cells: {
        'SEQ' : PlutoCell(value: nRowNum),
        'ITEM_NO': PlutoCell(value: e.ITEM_NO),
        'ITEM_LOT': PlutoCell(value: e.ITEM_LOT),
        'QUANTITY': PlutoCell(value: e.QUANTITY),
        'BOX_NO': PlutoCell(value: e.BOX_NO),
        'PALLET_SEQ': PlutoCell(value: e.PALLET_SEQ),
      },
    );
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
      field: 'SEQ',
      width: 50,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: '품목 코드',
      field: 'ITEM_NO',
      width: 150,
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
    PlutoColumn(
      title: 'SEQ',
      field: 'PALLET_SEQ',
      width: 50,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.number(),
    ),
  ];
}
// 하단 그리드
// 데이터 로우
List<PlutoRow> getPackGridRows(List<TbWhPallet> pallets) {
  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;
  for (var e in pallets) {
    nRowNum = nRowNum + 1;
    PlutoRow row = PlutoRow(
      cells: {
        'SEQ': PlutoCell(value: nRowNum),
        'ITEM_NO': PlutoCell(value: e.ITEM_NO),
        'ITEM_LOT': PlutoCell(value: e.ITEM_LOT),
        'QUANTITY': PlutoCell(value: e.QUANTITY),
        'BOX_NO': PlutoCell(value: e.BOX_NO),
        'PALLET_SEQ': PlutoCell(value: e.PALLET_SEQ),
      },
    );

    rows.add(row);
  }
  return rows;
}

// 하단 그리드
// 데이터 로우
PlutoRow getPackGridRow(TbWhPallet pallets) {
int val = pallets.PALLET_SEQ;

    PlutoRow row = PlutoRow(
      cells: {
        'PALLET_SEQ': PlutoCell(value: pallets.PALLET_SEQ),
        'ITEM_NO': PlutoCell(value: pallets.ITEM_NO),
        'ITEM_LOT': PlutoCell(value: pallets.ITEM_LOT),
        'BOX_NO': PlutoCell(value: pallets.BOX_NO),
      },
    );
  return row;
}
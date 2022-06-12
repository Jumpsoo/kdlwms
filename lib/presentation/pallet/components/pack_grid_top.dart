import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:pluto_grid/pluto_grid.dart';


// 상단 그리드 입력창용
// 컬럼 리스트 지정
// max => 180
List<PlutoColumn> getTopGridColumns() {
  return <PlutoColumn>[

    PlutoColumn(
      title: 'SEQ',
      field: 'palletSeq',
      width: 70,
      textAlign: PlutoColumnTextAlign.left,
      type: PlutoColumnType.number(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      enableRowChecked: true,
    ),
    PlutoColumn(
      title: '품목 코드',
      field: 'itemNo',
      width: 110,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.left,
      enableColumnDrag: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: 'LOT',
      field: 'itemLot',
      width: 70,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.left,
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
      title: 'Box',
      field: 'boxNo',
      width: 50,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
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
        'SEQ' : PlutoCell(value: e.palletSeq),
        'itemNo': PlutoCell(value: e.itemNo),
        'itemLot': PlutoCell(value: e.itemLot),
        'quantity': PlutoCell(value: e.quantity),
        'boxNo': PlutoCell(value: e.boxNo),
        'palletSeq': PlutoCell(value: e.palletSeq),
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
      title: 'h_comps',
      field: 'comps',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_workshop',
      field: 'workshop',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: 'h_location',
      field: 'location',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
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
      width: 110,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.left,
      enableColumnDrag: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: 'LOT',
      field: 'itemLot',
      width: 70,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.left,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: '수량',
      field: 'quantity',
      width: 0,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: 'h_state',
      field: 'state',
      width: 0,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_barcode',
      field: 'barcode',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_scanDate',
      field: 'scanDate',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.date(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_scanUsernm',
      field: 'scanUsernm',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'SEQNO',
      field: 'boxNo',
      width: 70,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: 'h_printFlag',
      field: 'printFlag',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_printDate',
      field: 'scanDate',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.date(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_printUser',
      field: 'printUser',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.number(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_as400IfFlag',
      field: 'as400IfFlag',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_as400IfDate',
      field: 'as400IfDate',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.date(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_as400IfUser',
      field: 'as400IfUser',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.number(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_rgstrId',
      field: 'rgstrId',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.number(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_rgstDt',
      field: 'rgstDt',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.date(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_updtrId',
      field: 'updtrId',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.number(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
    ),
    PlutoColumn(
      title: 'h_updtDt',
      field: 'updtDt',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.date(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      hide: true,
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
        'itemNo': PlutoCell(value: e.itemNo),
        'itemLot': PlutoCell(value: e.itemLot),
        'quantity': PlutoCell(value: e.quantity),
        'boxNo': PlutoCell(value: e.boxNo),
        'palletSeq': PlutoCell(value: e.palletSeq),
      },
    );

    rows.add(row);
  }
  return rows;
}

// 하단 그리드
// 데이터 로우
PlutoRow getPackGridRow(TbWhPallet pallets) {
int? val = pallets.palletSeq;

    PlutoRow row = PlutoRow(
      cells: {
        'palletSeq': PlutoCell(value: pallets.palletSeq),
        'itemNo': PlutoCell(value: pallets.itemNo),
        'itemLot': PlutoCell(value: pallets.itemLot),
        'boxNo': PlutoCell(value: pallets.boxNo),
      },

    );
  return row;
}
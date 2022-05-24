import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:flutter/material.dart';

class PalletGrid extends StatefulWidget {
  const PalletGrid({Key? key, required this.pallet}) : super(key: key);
  final List<TbWhPallet> pallet ;

  @override
  State<PalletGrid> createState() => _PalletGridState();
}

class _PalletGridState extends State<PalletGrid> {
  late PlutoGridStateManager stateManager;
  late List<TbWhPallet> pallets;

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: getColumns(),
      rows: getRows(),
      columnGroups: null,
      onLoaded: (PlutoGridOnLoadedEvent event) {
        stateManager = event.stateManager;
      },
      onChanged: (PlutoGridOnChangedEvent event) {},
      configuration: const PlutoGridConfiguration(
        enableColumnBorder: true,
        columnHeight: 35,
      ),
    );
  }
  // 컬럼 리스트 지정
  List<PlutoColumn> getColumns() {
    return <PlutoColumn>[
      PlutoColumn(
        title: 'palletSeq  ',
        field: 'palletSeq  ',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'workshop',
        field: 'workshop',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'location',
        field: 'location',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'itemNo',
        field: 'itemNo',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'itemLot',
        field: 'itemLot',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'quantity',
        field: 'quantity',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'state',
        field: 'state',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'barcode',
        field: 'barcode',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'scanDate',
        field: 'scanDate',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'scanUsernm',
        field: 'scanUsernm',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'boxNo',
        field: 'boxNo',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'printFlag',
        field: 'printFlag',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'printDate',
        field: 'printDate',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'printUser',
        field: 'printUser',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'as400ifFlag',
        field: 'as400ifFlag',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'as400ifDate',
        field: 'as400ifDate',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'as400ifUser',
        field: 'as400ifUser',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'rgstrId',
        field: 'rgstrId',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'rgstDt',
        field: 'rgstDt',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'updtrId',
        field: 'updtrId',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'updtDt',
        field: 'updtDt',
        type: PlutoColumnType.text(),
      ),
    ];
  }

  List<PlutoRow> getRows() {
    List<PlutoRow> rows = List.empty(growable: true);

    for (var e in pallets) {
      PlutoRow row = PlutoRow(
        cells: {
          'PALLET_SEQ  ': PlutoCell(value: e.PALLET_SEQ),
          'WORKSHOP': PlutoCell(value: e.WORKSHOP),
          'LOCATION': PlutoCell(value: e.LOCATION),
          'ITEM_NO': PlutoCell(value: e.ITEM_NO),
          'ITEM_LOT': PlutoCell(value: e.ITEM_LOT),
          'QUANTITY': PlutoCell(value: e.QUANTITY),
          'STATE': PlutoCell(value: e.STATE),
          'BARCODE': PlutoCell(value: e.BARCODE),
          'SCAN_DATE': PlutoCell(value: e.SCAN_DATE),
          'SCAN_USERNM': PlutoCell(value: e.SCAN_USERNM),
          'BOX_NO': PlutoCell(value: e.BOX_NO),
          'PRINT_FLAG': PlutoCell(value: e.PRINT_FLAG),
          'PRINT_DATE': PlutoCell(value: e.PRINT_DATE),
          'PRINT_USER': PlutoCell(value: e.PRINT_USER),
          'AS400IF_FLAG': PlutoCell(value: e.AS400IF_FLAG),
          'AS400IF_DATE': PlutoCell(value: e.AS400IF_DATE),
          'AS400IF_USER': PlutoCell(value: e.AS400IF_USER),
          'RGSTR_ID': PlutoCell(value: e.RGSTR_ID),
          'RGST_DT': PlutoCell(value: e.RGST_DT),
          'UPDTR_ID': PlutoCell(value: e.UPDTR_ID),
          'UPDT_DT': PlutoCell(value: e.UPDT_DT),
        },
      );

      rows.add(row);
    }
    return rows;
  }

  /// columnGroups that can group columns can be omitted.
  final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(title: 'palletSeq  ', fields: ['palletSeq  '],),
    PlutoColumnGroup(title: 'workshop', fields: ['workshop'],),
    PlutoColumnGroup(title: 'location', fields: ['location'],),
    PlutoColumnGroup(title: 'itemNo', fields: ['itemNo'],),
    PlutoColumnGroup(title: 'itemLot', fields: ['itemLot'],),
    PlutoColumnGroup(title: 'quantity', fields: ['quantity'],),
    PlutoColumnGroup(title: 'state', fields: ['state'],),
    PlutoColumnGroup(title: 'barcode', fields: ['barcode'],),
    PlutoColumnGroup(title: 'scanDate', fields: ['scanDate'],),
    PlutoColumnGroup(title: 'scanUsernm', fields: ['scanUsernm'],),
    PlutoColumnGroup(title: 'boxNo', fields: ['boxNo'],),
    PlutoColumnGroup(title: 'printFlag', fields: ['printFlag'],),
    PlutoColumnGroup(title: 'printDate', fields: ['printDate'],),
    PlutoColumnGroup(title: 'printUser', fields: ['printUser'],),
    PlutoColumnGroup(title: 'as400ifFlag', fields: ['as400ifFlag'],),
    PlutoColumnGroup(title: 'as400ifDate', fields: ['as400ifDate'],),
    PlutoColumnGroup(title: 'as400ifUser', fields: ['as400ifUser'],),
    PlutoColumnGroup(title: 'rgstrId', fields: ['rgstrId'],),
    PlutoColumnGroup(title: 'rgstDt', fields: ['rgstDt'],),
    PlutoColumnGroup(title: 'updtrId', fields: ['updtrId'],),
    PlutoColumnGroup(title: 'updtDt', fields: ['updtDt'],),
  ];
}



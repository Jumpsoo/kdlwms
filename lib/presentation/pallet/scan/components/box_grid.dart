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
          'palletSeq  ': PlutoCell(value: e.palletSeq),
          'workshop': PlutoCell(value: e.workshop),
          'location': PlutoCell(value: e.location),
          'itemNo': PlutoCell(value: e.itemNo),
          'itemLot': PlutoCell(value: e.itemLot),
          'quantity': PlutoCell(value: e.quantity),
          'state': PlutoCell(value: e.state),
          'barcode': PlutoCell(value: e.barcode),
          'scanDate': PlutoCell(value: e.scanDate),
          'scanUsernm': PlutoCell(value: e.scanUsernm),
          'boxNo': PlutoCell(value: e.boxNo),
          'printFlag': PlutoCell(value: e.printFlag),
          'printDate': PlutoCell(value: e.printDate),
          'printUser': PlutoCell(value: e.printUser),
          'as400IfFlag': PlutoCell(value: e.as400IfFlag),
          'as400IfDate': PlutoCell(value: e.as400IfDate),
          'as400IfUser': PlutoCell(value: e.as400IfUser),
          'rgstrId': PlutoCell(value: e.rgstrId),
          'rgstDt': PlutoCell(value: e.rgstDt),
          'updtrId': PlutoCell(value: e.updtrId),
          'updtDt': PlutoCell(value: e.updtDt),
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



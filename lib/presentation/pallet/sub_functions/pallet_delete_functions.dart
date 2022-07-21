// 04. 상차완료 세부 함수
import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';

import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

Future<void> createDeleteButtomGridView(
  BuildContext context,
  PlutoGridStateManager gridStateManager,
  bool isMsg,
) async {
  //초기화
  PalletViewModel viewModel = context.read<PalletViewModel>();
  gridStateManager.rows.clear();
  gridStateManager.removeRows(gridStateManager.rows);

  //조회
  Result result = await viewModel.useCasesWms.selectPalletForDeleteUseCase();

  result.when(success: (valueList) {
    List<TbWhPalletForDelete>? pallets = valueList;

    if (pallets == null) {
      if (isMsg == true) {
        showCustomSnackBarSuccess(context, '해당 태그로 상차가능한 항목이 없습니다.', false);
      }
    } else {
      gridStateManager.appendRows(getLoadDeleteGridRows(pallets));
      gridStateManager.notifyListeners();
    }
  }, error: (message) {
    showCustomSnackBarWarn(context, message);
  });
}

// 하단그리드 입력창용
// 컬럼 리스트 지정
// max => 180
List<PlutoColumn> getDeleteGridColumns() {
  return <PlutoColumn>[
    PlutoColumn(
      title: 'comps',
      field: 'comps',
      width: 0,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.center,
      enableColumnDrag: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: 'location',
      field: 'location',
      width: 0,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      // enableRowChecked: true,
    ),
    PlutoColumn(
      title: '로케이션',
      field: 'locationNm',
      width: 120,
      textAlign: PlutoColumnTextAlign.right,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
      // enableRowChecked: true,
    ),
    PlutoColumn(
      title: 'arrival',
      field: 'arrival',
      width: 0,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: '도착창고',
      field: 'arrivalNm',
      width: 120,
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
    PlutoColumn(
      title: '수량',
      field: 'boxCnt',
      width: 100,
      type: PlutoColumnType.number(),
      textAlign: PlutoColumnTextAlign.right,
      enableColumnDrag: false,
      enableContextMenu: false,
      enableEditingMode: false,
    ),
  ];
}

// 하단 그리드
// 데이터 로우
List<PlutoRow> getLoadDeleteGridRows(List<TbWhPalletForDelete> pallets) {
  List<PlutoRow> rows = List.empty(growable: true);
  int nRowNum = 0;
  for (var e in pallets) {
    nRowNum = nRowNum + 1;
    PlutoRow row = PlutoRow(
      cells: {
        'comps': PlutoCell(value: e.comps),
        'location': PlutoCell(value: e.location),
        'locationNm': PlutoCell(value: e.locationNm),
        'arrival': PlutoCell(value: e.arrival),
        'arrivalNm': PlutoCell(value: e.arrivalNm),
        'boxCnt': PlutoCell(value: e.boxCnt),
      },
    );
    rows.add(row);
  }
  return rows;
}

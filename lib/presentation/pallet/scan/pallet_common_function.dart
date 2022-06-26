import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

Future<String?> palletCommonGetDefaultWorkShop(BuildContext context) async {
  SettingInfoViewModel viewModelShop = context.read<SettingInfoViewModel>();
  String? defaultLocation;
//기본 창고값 가져오기
  Result? resultSetFlag =
      await viewModelShop.useCaseCommonInfo.selectTbCmLocationCurrentItem();
  resultSetFlag.when(success: (val) {
    defaultLocation = val.WORKSHOP;
  }, error: (message) {
    defaultLocation = '';
  });
  return defaultLocation;
}

//체크로직, 완료, 삭제 시
Future<bool> checkValue(BuildContext context, String confirm,
    PlutoGridStateManager gridStateManager, String sQrCode) async {
  int nCheckedItemCnt = 0;

  switch (confirm) {
    case 'CONFIRM':
      if (gridStateManager.rows.isEmpty) {
        showCustomSnackBarWarn(context, '완료 처리 할 항목이 없습니다.');
        return false;
      }

      if (await showAlertDialogQ(
            context,
            '확인',
            '작업 중인 내용을 완료처리 하시겠습니까?',
          ) ==
          false) {
        return false;
      }
      break;

    case 'LOAD':
      if (gridStateManager.rows.isEmpty) {
        showCustomSnackBarWarn(context, '상차 처리 할 항목이 없습니다.');
        return false;
      }

      if (await showAlertDialogQ(
            context,
            '확인',
            '작업 중인 내용을 상차완료 처리 하시겠습니까?',
          ) ==
          false) {
        return false;
      }
      break;

    case 'DELETE':
      if (gridStateManager.rows.isEmpty) {
        showCustomSnackBarWarn(context, '삭제할 항목이 없습니다.');
        return false;
      }
      if (gridStateManager.currentCell == null) {
        await showAlertDialog(context, '선택된 항목이 없습니다. \r\n 먼저 항목을 체크하세요.');
        return false;
      }

      if (await showAlertDialogQ(
            context,
            '확인',
            '작업 중인 내용을 삭제 하시겠습니까?',
          ) ==
          false) {
        return false;
      }
      break;
    case 'PRINT':
      if (gridStateManager.rows.isEmpty) {
        showCustomSnackBarWarn(context, '인쇄할 항목이 없습니다.');
        return false;
      }
      for (PlutoRow row in gridStateManager.rows) {
        if (row.checked == true) {
          nCheckedItemCnt = nCheckedItemCnt + 1;
        }
      }

      if (nCheckedItemCnt == 0) {
        await showAlertDialog(context, '선택된 항목이 없습니다. \r\n 먼저 항목을 체크하세요.');
        return false;
      }

      if (await showAlertDialogQ(
            context,
            '확인',
            '선택 한 내용을 인쇄 하시겠습니까?',
          ) ==
          false) {
        return false;
      }

      break;

    case 'READ_QR':
      if (sQrCode.length < gAvailableQrLength) {
        showCustomSnackBarWarn(context, '입력가능한 식별표가 아닙니다. 식별표를 확인하세요..');
        return false;
      }
      break;
  }
  return true;
}

//선택된 항목 삭제
Future<bool> deletePackItem(
  BuildContext context,
  PlutoGridStateManager gridStateManager,
  String sWorkshop,
  String sLocation,
  int nState,
) async {
  PalletViewModel viewModel = context.read<PalletViewModel>();

  if (await checkValue(context, 'DELETE', gridStateManager, '') == false) {
    return false;
  }
  List<TbWhPallet> tbWhPallets = [];

  // for (PlutoRow row in gridStateManager.currentSelectingRows) {
  PlutoRow row = gridStateManager.currentCell!.row;

  List<PlutoCell> cells = row.cells.values.toList();

  tbWhPallets.add(TbWhPallet(
      comps: gComps,
      itemNo: cells[1].value,
      itemLot: cells[2].value,
      quantity: cells[4].value,
      palletSeq: cells[3].value,
      barcode: cells[5].value));

  if (tbWhPallets.isEmpty) {
    hideCircularProgressIndicator();
    showCustomSnackBarWarn(context, '완료처리 할 내용이 없습니다.');
    return false;
  }

  viewModel.useCasesWms.deletePallet(tbWhPallets);
  showCustomSnackBarSuccess(context, '정상처리 되었습니다.');

  return true;
}

//최초로딩시 콤보박스 세팅
//데이터가 없는 경우 하단 알람 창에 메세지 전시
Future<List<ComboValueType>> getWorkshopComboValueList(
    BuildContext context) async {
  SettingInfoViewModel viewModel = context.read<SettingInfoViewModel>();
  viewModel = context.read<SettingInfoViewModel>();
  //전체리스트 조회
  Result? result = await viewModel.useCaseCommonInfo.selectTbCmLocationAll();
  List<ComboValueType> comboItemList = [];

  result.when(
      success: (c) {
        for (TbCmLocation tb in c) {
          ComboValueType item =
              ComboValueType(key: tb.WORKSHOP, value: tb.WORKSHOP_NM!);
          comboItemList.add(item);
        }
      },
      error: (message) {});

  //빈값 추가
  comboItemList.add(ComboValueType(key: '', value: '선택'));

  return comboItemList;
}

Future<List<ComboValueType>> getLocationComboValueList(
    BuildContext context) async {
  SettingInfoViewModel viewModel = context.read<SettingInfoViewModel>();
  viewModel = context.read<SettingInfoViewModel>();
  //전체리스트 조회
  Result? result =
      await viewModel.useCaseCommonInfo.selectTbWhCmCodeListByGrpCd('LOCATION');
  List<ComboValueType> comboItemList = [];

  result.when(
      success: (c) {
        print(TbWhCmCode);
        for (TbWhCmCode tb in c) {
          ComboValueType item = ComboValueType(
              key: tb.codeCd!, value: tb.codeCd! + ':' + tb.codeKoNm!);
          comboItemList.add(item);
        }
      },
      error: (message) {});

  //빈값 추가
  comboItemList.add(ComboValueType(key: '', value: '선택'));
  return comboItemList;
}

PlutoGridConfiguration getGridStyle1() {
  return const PlutoGridConfiguration(
      enterKeyAction: PlutoGridEnterKeyAction.none,
      enableColumnBorder: true,
      rowHeight: 30,
      columnHeight: 30,
      scrollbarConfig:
          PlutoGridScrollbarConfig(isAlwaysShown: true, scrollbarThickness: 5),
      cellTextStyle: TextStyle(fontSize: 12));
}

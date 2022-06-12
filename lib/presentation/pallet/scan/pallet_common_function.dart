import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/components/pack_grid_top.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_local_variables.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

Future<String?> palletCommonGetDefaultWorkShop(BuildContext context) async {
  SettingWorkshopViewModel viewModelShop =
      context.read<SettingWorkshopViewModel>();
  String? defaultLocation;
//기본 창고값 가져오기
  Result? resultSetFlag =
      await viewModelShop.useCaseTbCmLocation.selectTbCmLocationCurrentItem();
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
    case 'DELETE':
      if (gridStateManager.rows.isEmpty) {
        showCustomSnackBarWarn(context, '삭제할 항목이 없습니다.');
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
    case 'READ_QR':
      if (sQrCode.length < gAvailableQrLength) {
        showCustomSnackBarWarn(context, '입력가능한 식별표가 아닙니다. 식별표를 확인하세요..');
        return false;
      }
      break;
  }
  return true;
}

//작업위치, 창고별 조회
// 리스트 초기화 -> 데이터 조회 -> 바인딩
Future<void> palletCommonViewTopList(
    BuildContext context,
    PlutoGridStateManager gridStateManager,
    String sLocation,
    String sWareHouse) async {

  //초기화
  PalletViewModel viewModel = context.read<PalletViewModel>();
  gridStateManager.rows.clear();
  gridStateManager.removeRows(gridStateManager.rows);
  //조회
  List<TbWhPallet>? pallets = await viewModel.useCasesWms
      .listPallets(sLocation, sWareHouse, LoadState.Pack.index);

  if (pallets == null) {
    showCustomSnackBarSuccess(context, '해당 작업위치에 입력완료한 실적이 없습니다.');
  } else {
    gridStateManager.appendRows(
      getTopGridRows(pallets),
    );
    gridStateManager.notifyListeners();
  }
}

// 하단그리드용 그리드 조회 메서드
// 상태가 입력(packing) 중인 항목만 조회된다.
// 기존행 클리어 -> 조회 -> 바인딩
Future<void> palletCommonViewBottomList(
    BuildContext context,
    PlutoGridStateManager gridStateManager,
    String sLocation,
    String sWareHouse) async {
  //초기화
  PalletViewModel viewModel = context.read<PalletViewModel>();
  gridStateManager.removeRows(gridStateManager.rows);
  //조회
  List<TbWhPallet>? pallets = await viewModel.useCasesWms
      .listPallets(sLocation, sWareHouse, LoadState.Confirm.index);
  //바인딩
  writeLog(pallets);
  if (pallets == null) {
    // _setMsg('해당 작업위치에 입력완료한 실적이 없습니다.');
  } else {
    gridStateManager.appendRows(
      getPackGridRows(pallets),
    );
    gridStateManager.notifyListeners();
  }
}

//삭제
void deletePackItem(
    BuildContext context, PlutoGridStateManager gridStateManager) async {

  PalletViewModel viewModel = context.read<PalletViewModel>();

  if (await checkValue(context, 'DELETE', gridStateManager, '') == false) {
    return;
  }
  List<TbWhPallet> pallets = [];
  for (PlutoRow row in gridStateManager.rows) {
    List<PlutoCell> cells = row.cells.values.toList();
    pallets.add(TbWhPallet(
      palletSeq: cells[TopGridColumnIndex.palletSeq.index].value,
      boxNo: cells[TopGridColumnIndex.SEQ.index].value,
      state: 1,
    ));
  }
  if (pallets.isEmpty) {
    hideCircularProgressIndicator();
    showCustomSnackBarWarn(context, '완료처리 할 내용이 없습니다.');
    return;
  }
  viewModel.useCasesWms.deletePallet(pallets);
  showCustomSnackBarSuccess(context, '정상처리 되었습니다.');
}

//최초로딩시 콤보박스 세팅
//데이터가 없는 경우 하단 알람 창에 메세지 전시
Future<List<ComboValueType>> palletCommonGetLocationComboValueList(
    BuildContext context) async {

  SettingWorkshopViewModel viewModel = context.read<SettingWorkshopViewModel>();
  viewModel = context.read<SettingWorkshopViewModel>();
  //전체리스트 조회
  Result? result = await viewModel.useCaseTbCmLocation.selectTbCmLocationAll();
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

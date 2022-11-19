import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_cm_location.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
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

    defaultLocation = val.workshop;
  }, error: (message) {
    defaultLocation = '';
  });
  return defaultLocation;
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
              ComboValueType(key: tb.workshop, value: tb.workshopNm!);
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
        for (TbWhCmCode tb in c) {
          ComboValueType item = ComboValueType(
              key: tb.codeCd!, value: tb.codeCd! + ':' + (tb.ref1 == null ? '' : tb.ref1!));
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

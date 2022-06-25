import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/domain/model/tb_wh_pallet.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/pallet/components/print_grid.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_common_function.dart';
import 'package:kdlwms/presentation/pallet/scan/pallet_viewmodel.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

class PrintingLabels extends StatefulWidget {
  final String title;

  const PrintingLabels({Key? key, required this.title}) : super(key: key);

  @override
  State<PrintingLabels> createState() => _PrintingLabelsState();
}

class _PrintingLabelsState extends State<PrintingLabels> {
  @override
  void initState() {
    super.initState();

    hideCircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    late PalletViewModel viewModel;
    late SettingInfoViewModel viewModelShop;

    // 그리드메니저
    late final PlutoGridStateManager topGridStateManager;

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 5)),
            //하단그리드
            Container(
              height: 450,
              child: PlutoGrid(
                columns: getPrintItemColumns(),
                mode: PlutoGridMode.select,
                rows: [],
                // columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  topGridStateManager = event.stateManager;
                  viewPrintingList(
                    context,
                    topGridStateManager,
                    LoadState.Confirm.index,
                  );
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  //to do
                },
                configuration: const PlutoGridConfiguration(
                  enterKeyAction: PlutoGridEnterKeyAction.none,
                  enableColumnBorder: true,
                  rowHeight: 50,
                  columnHeight: 50,
                  cellTextStyle: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey[900],
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '조회',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.print_outlined),
              label: '발행',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: '전화면',
            ),
          ],
          onTap: (index) => {
                if (index == 0)
                  {
                    //조회
                    viewPrintingList(context, topGridStateManager, LoadState.Confirm.index),
                  }
                else if (index == 1)
                  {
                    pringtingPalletList(
                      context,
                      topGridStateManager,
                      LoadState.Confirm.index,
                    ),
                  }
                else if (index == 2)
                  {
                    //종료
                    Future.delayed(const Duration(seconds: 1), () async {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      Navigator.pop(context);
                    }),
                  }
              }),
    );
  }

  //인쇄 대상 조회
  Future<void> viewPrintingList(BuildContext context,
      PlutoGridStateManager gridStateManager, int nState) async {


    //초기화
    PalletViewModel viewModel = context.read<PalletViewModel>();
    gridStateManager.rows.clear();
    gridStateManager.removeRows(gridStateManager.rows);

    //조회
    List<TbWhPallet>? pallets =
        await viewModel.useCasesWms.selectPrintingList(nState);

    if (pallets == null) {
      showCustomSnackBarSuccess(context, '해당 작업위치에 입력 완료한 실적이 없습니다.');
    } else {
      List<PlutoRow> rows = getPrintGridRows(pallets.toSet().toList());

      gridStateManager.appendRows(
          rows
      );
      gridStateManager.notifyListeners();
    }
  }

//선택된 항목 인쇄
  Future<bool> pringtingPalletList(
    BuildContext context,
    PlutoGridStateManager gridStateManager,
    int nState,
  ) async {

    if (await checkValue(context, 'PRINT', gridStateManager, '') ==
        false) {
      return false;
    }
    PalletViewModel viewModel = context.read<PalletViewModel>();

    List<TbWhPallet> tbWhPallets = [];
    for (PlutoRow row in gridStateManager.rows) {
      if (row.checked == true) {
        List<PlutoCell> cells = row.cells.values.toList();
        tbWhPallets.add(TbWhPallet(
            comps: gComps,
            workshop: cells[1].value,
            palletSeq: cells[2].value,
            location: cells[3].value
        ));
      }
    }

    if (tbWhPallets.isEmpty) {
      hideCircularProgressIndicator();
      showCustomSnackBarWarn(context, '인쇄 할 내용이 없습니다.');
      return false;
    }

    viewModel.useCasesWms.printingPalletUseCase(tbWhPallets, LoadState.Confirm.index);
    showCustomSnackBarSuccess(context, '인쇄할 내용이 전송되었습니다..');

    return true;
  }
}

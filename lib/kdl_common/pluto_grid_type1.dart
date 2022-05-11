import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

// PlutoColumns 와 PlutoRows 를 받아서 그리드를 구성한다.
// PlutoColumns 는 상수값으로 받을 수있지만  rows 값은 null 이있을 수있다.
// rows는 데이터 가없는 경우 빈행을 뿌려주도록 설정하자.
// 추가적으로 체크박스 옵션을 두면 좋을거같다.
class PlutoGridType1 extends StatefulWidget {
  final List<PlutoRow> pRows;
  final List<PlutoColumn> pColumns;

  const PlutoGridType1({Key? key, required this.pRows, required this.pColumns})
      : super(key: key);

  @override
  State<PlutoGridType1> createState() => _PlutoGridType1State();
}

class _PlutoGridType1State extends State<PlutoGridType1> {

  get pColumns => null;
  get pRows => null;

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: [pColumns],
      rows: [pRows],

      configuration: const PlutoGridConfiguration(
        enableColumnBorder: true,
        columnHeight: 35,
      ),

    );
  }
}

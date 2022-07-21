import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/presentation/pallet/components/btn_packing.dart';
import 'package:kdlwms/presentation/pallet/components/btn_packing_delete.dart';
import 'package:kdlwms/presentation/pallet/components/btn_packing_load.dart';
import 'package:kdlwms/presentation/pallet/components/btn_packing_view.dart';
import 'package:kdlwms/presentation/pallet/components/btn_print_label.dart';

import 'components/btn_move_previous.dart';

class PltWorkFrame extends StatelessWidget {
  const PltWorkFrame({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '팔레팅 작업(실적 입력)',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.e
        primarySwatch: Colors.lightBlue,
      ),
      home: const PltWorkPage(title: '팔레팅 작업(실적 입력)'),
    );
  }
}

class PltWorkPage extends StatefulWidget {
  const PltWorkPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<PltWorkPage> createState() => _SubMainPagState();
}

class _SubMainPagState extends State<PltWorkPage> {
  String? localMsg = "준비";

  @override
  void initState(){
    super.initState();
    hideCircularProgressIndicator();
  }

  @override
  void dispose() {
    super.dispose();
  }
  //생성자
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('팔레팅 작업'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
          child: Column(
            children:  [
              const BtnPacking(),//1.적재작업
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const BtnPrintLabel(),//2.라벨발행
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const BtnPackingView(),//3.실적조회
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const BtnPackingLoad(),//4.상차화면
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const BtnPackingDelete(),//5.적재이력삭제
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const BtnMovePrevious(), //6.이전화면
              const Padding(padding: EdgeInsets.only(bottom: 5)),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.only(left: 0),
                alignment: Alignment.centerLeft,
                width: 320,
                height: 20,
                child: Row(
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.circle_notifications,
                            color: Colors.white, size: 20.0),
                      ],
                    ),
                    Column(
                      children: [
                        AutoSizeText(
                          localMsg!,
                          style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

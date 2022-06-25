import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/web_sync/data_sync.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/main_frame_widgets/btn_move_exit.dart';
import 'package:kdlwms/presentation/main_frame_widgets/navigation_bar_main.dart';
import 'main_frame_widgets/btn_move_packing.dart';
import 'main_frame_widgets/btn_set_location.dart';

class MainFrame extends StatelessWidget {
  final String localVersion = '';

  const MainFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //글로벌 context 지정
    gTransitContext = context;

    return MaterialApp(
      title: '창고 이동관리',
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
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(title: '창고 이동관리'),
      //화면 이동간 처리정의
      // routes: {
      //   '/MainFrame': (context) => MainFrame(),
      //   '/SubMainFrame': (context) => SubMainFrame(),
      // },
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({Key? key, required this.title}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

   @override
  void initState() {

    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_)=>syncData(true));

   }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Colors.purple,
                              style: BorderStyle.solid,
                              width: 2),
                        ),
                        child: Text(
                          gblCompanyLogoText,
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.deepOrange[700],
                              fontFamily: "Roboto"),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      width: 220.0,
                      height: 50.0,
                      child: const Text(
                        '창고이동시스템',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: "Roboto"),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 250.0,
                  height: 50.0,
                  child: Row(
                    children:  [
                      const Text(
                        '현재버전: ',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: "Roboto"),
                      ),
                      AutoSizeText(
                        gCurrentVersion,
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: "Roboto"),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // 첫번째 버튼
            const Padding(padding: EdgeInsets.only(top: 10)),
            const BtnMovePacking(),

            //두번째 버튼
            const Padding(padding: EdgeInsets.only(top: 10)),
            const BtnSetLocation(),

            //세번째 버튼
            const Padding(padding: EdgeInsets.only(top: 10)),
            const BtnExit(),
          ],
        ),
      ),
      bottomNavigationBar: const MainFrameNavigationBarMain(),
    );
  }
}

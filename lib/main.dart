import 'package:flutter/material.dart';
import 'package:kdlwms/di/provider_wms_setup.dart';
import 'package:kdlwms/presentation/main_frame.dart';
import 'package:kdlwms/ui/colors.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  // 플랫폼 채널의 위젯 바인딩을 보장
  WidgetsFlutterBinding.ensureInitialized();

  final List<SingleChildWidget> providers = [];

  providers.addAll(await getWmsProviders());

  // final providers = await getWmsProviders();

  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        unselectedWidgetColor: Colors.white,
        primaryColor: Colors.white,
        backgroundColor: darkGray,
        canvasColor: darkGray,
        floatingActionButtonTheme:
            Theme.of(context).floatingActionButtonTheme.copyWith(
                  backgroundColor: Colors.white,
                  foregroundColor: darkGray,
                ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: darkGray,
            ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
        ),
      ),
      home: const MainFrame(),
    );
  }
}

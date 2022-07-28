
import 'package:flutter/material.dart';
import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/di/provider_wms_setup.dart';
import 'package:kdlwms/domain/model/tb_server_info.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';
import 'package:kdlwms/presentation/main_frame.dart';
import 'package:kdlwms/presentation/set_workshop/setting_workshop_viewmodel.dart';
import 'package:kdlwms/ui/colors.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  // 플랫폼 채널의 위젯 바인딩을 보장
  WidgetsFlutterBinding.ensureInitialized();

  final List<SingleChildWidget> providers = [];

  providers.addAll(await getWmsProviders());

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
    Future<String> varUrl = _getUrl(context);

    varUrl.then((val) {

      if (val.isNotEmpty) {
        gServiceURL = val;
      } else {}
    }).catchError((error) {
      //
    });

    Future<String> varDeviceId = _getPropertyInfo(context);
    varDeviceId.then((val) {
      if (val.isNotEmpty) {
        gDeviceId = val;
      } else {
        gDeviceId = 'No_DEVICE';
      }
    }).catchError((error) {
      //
    });

    _getPropertyInfo(context);

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

  //최초 url을 조회해온다.
  Future<String> _getUrl(BuildContext context) async {
    String sUrl = '';
    SettingInfoViewModel viewModelSetting;
    viewModelSetting = context.read<SettingInfoViewModel>();
    sUrl = await viewModelSetting.useCaseServerInfo.selectTbServerInfoUseCase();

    return sUrl;
  }

  //최초 장치명 및 기타정보를 조회한다.
  Future<String> _getPropertyInfo(BuildContext context) async {
    String sDeviceId = '';
    SettingInfoViewModel viewModelSetting;
    viewModelSetting = context.read<SettingInfoViewModel>();

    Result result =
        await viewModelSetting.useCaseServerInfo.selectPropertyInfoUseCase();
    result.when(success: (value) {
      TbServerInfo info = value;
      gDeviceId = info.deviceId!;
      gVibrateEnable = info.vibrateState!;
      gScanAlwaysOn = info.scanAlwaysState!;


    }, error: (message) {
      //showCustomSnackBarWarn(context, message);
    });

    return sDeviceId;
  }
}

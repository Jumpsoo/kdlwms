import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:upgrade_util/upgrade_util.dart';

class Upgrader extends StatelessWidget {
  const Upgrader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class KdlwmsUpgrader extends StatefulWidget {
  const KdlwmsUpgrader({Key? key}) : super(key: key);

  @override
  State<KdlwmsUpgrader> createState() => _KdlwmsUpgraderState();
}

class _KdlwmsUpgraderState extends State<KdlwmsUpgrader> {
  final List<String> list = <String>[
    'Android Test: Get the download of apk',
    'Android Test: Get Available Market',
    'Jump To AppStore Reviews Page',
    'Jump To AppStore and Write Review',
    'Jump To Detail Page',
    'Upgrade Dialog',
  ];

  final String wechatAppleID = '414478124';

  @override
  Widget build(BuildContext context)  => _platformWidget();

  Widget _platformWidget() {
    Widget child = Center(
      child: Text('김성수 【 $operatingSystem 】김성수'),
    );

    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      child = _buildBodyWidget();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('App Upgrade Example')),
      body: child,
    );
  }


  Widget _buildBodyWidget() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final ElevatedButton child = ElevatedButton(
          onPressed: () async => onPressed(index),
          child: Text(list[index]),
        );

        return Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: child,
        );
      },
      itemCount: list.length,
    );
  }

  Future<void> onPressed(int index) async {
    print('>>>>>>>>>>>>>>>>> AAAA ');
    switch (index) {
      case 0:

        final String result = await UpgradeUtil.getDownloadPath();
        print(">> : $result");
        debugPrint(result);
        break;
      case 1:
      // Get a list of all the app markets in the phone.
        final List<AndroidMarketModel> marketPackages =
        await UpgradeUtil.getMarkets(AndroidMarket.allTrue.toMarkets());
        debugPrint(marketPackages.toString());
        break;
      case 2:
      // Jump to the AppStore review page, here we use WeChat as an example.
        await UpgradeUtil.jumpToStore(
          jumpMode: JumpMode.reviewsPage,
          appleId: wechatAppleID,
        );
        break;
      case 3:
      // Jump to AppStore and comment, here we use WeChat as an example.
        await UpgradeUtil.jumpToStore(
          jumpMode: JumpMode.writeReview,
          appleId: wechatAppleID,
        );
        break;
      case 4:
      // Jump to the details page, here we use WeChat as an example.
        await UpgradeUtil.jumpToStore(
          jumpMode: JumpMode.detailPage,
          appleId: wechatAppleID,
        );
        break;
      case 5:
      // Show update dialog, here we use WeChat as an example.
        await showUpgradeDialog<void>(
          context,
          upgradeConfig: UpgradeConfig(
            title: 'sskkim .8.8.414174360',
            content: '테스트 ',
          ),
          iOSUpgradeConfig: IosUpgradeConfig(appleId: wechatAppleID),
          androidUpgradeConfig:
          AndroidUpgradeConfig(androidMarket: AndroidMarket.allTrue),
        );
        break;
      default:
        break;
    }
  }

  /// Operating system description
  static String get operatingSystem {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isMacOS) {
      return 'macOS';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else if (Platform.isFuchsia) {
      return 'Fuchsia OS';
    } else if (kIsWeb) {
      return 'Web';
    }

    return '';
  }

}

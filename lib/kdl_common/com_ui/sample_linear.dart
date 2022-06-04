import 'package:flutter/material.dart';
import 'package:kdlwms/kdl_common/com_ui/linear_indicator_page.dart';
class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  void _openPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              child: Text("Linear Library"),
              onPressed: () => _openPage(CustomLinearPage()),
            ),
          ],
        ),
      ),
    );
  }
}
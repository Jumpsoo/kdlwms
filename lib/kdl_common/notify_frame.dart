import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NotiPage extends StatefulWidget {
  const NotiPage({
    Key? key,
    required this.msg,
  }) : super(key: key);

  final String msg;

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(left: 0),
      alignment: Alignment.centerLeft,
      width: 330,
      height: 40,
      child: Row(
        children: [
          Column(
            children: const [
              Icon(Icons.circle_notifications, color: Colors.white, size: 30.0),
            ],
          ),
          Column(
            children: [
              AutoSizeText(
                widget.msg,
                style: const TextStyle(
                    fontSize: 18.0, color: Colors.white, fontFamily: "Roboto"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


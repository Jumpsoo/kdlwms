import 'package:flutter/material.dart';

class CustomProgressBar extends StatefulWidget {
  final String title;

  const CustomProgressBar({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _CustomProgressBarState extends State<CustomProgressBar>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          LinearProgressIndicator(
            value: controller.value,
            semanticsLabel: 'Linear progress indicator',
          ),
        ],
      ),
    );
  }
}

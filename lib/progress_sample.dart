

import 'package:flutter/material.dart';

class ProgressTest extends StatefulWidget {
  const ProgressTest({Key? key}) : super(key: key);

  @override
  State<ProgressTest> createState() => _ProgressTestState();
}

class _ProgressTestState extends State<ProgressTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KindaCode.com')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 10,
              ),
            ),
            Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.amber),
              child: const CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

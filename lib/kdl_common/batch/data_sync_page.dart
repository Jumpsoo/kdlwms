
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DataSyncPage extends StatefulWidget {
  final String title ;
  const DataSyncPage({Key? key, required this.title}) : super(key: key);

  @override
  State<DataSyncPage> createState() => _DataSyncPageState();
}

class _DataSyncPageState extends State<DataSyncPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 150,
              )
            ],
          ),
          Row(
            children: [
               ElevatedButton(
                onPressed: () async {
                  // To do
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(85, 40),
                  primary: Colors.teal[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const AutoSizeText(
                  '데이터 동기화',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Roboto"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

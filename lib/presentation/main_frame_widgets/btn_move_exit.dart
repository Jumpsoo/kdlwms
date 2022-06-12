import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlwms/kdl_common/common_functions.dart';
import 'package:kdlwms/kdl_common/kdl_globals.dart';

class BtnExit extends StatelessWidget {
  const BtnExit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sNo = '3';
    var sTitle = '종   료';
    var sSubTitle = '프로그램을 나갑니다';

    
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: gWidthButtonLarge,
          height: gHeightButtonLarge,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.brown[600],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: Colors.brown, style: BorderStyle.solid, width: 2),
          ),
          child: ElevatedButton(
            onPressed: () async {
              exitProgram(context);
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(gWidthButtonLarge, gHeightButtonLarge),
              primary: Colors.brown[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 40,
                  child: Text(
                    sNo,
                    style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: "Roboto"),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 230,
                  height: 100,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            sTitle,
                            style: const TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            sSubTitle,
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

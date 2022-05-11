import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var navigationBarMain = BottomNavigationBar(
    backgroundColor: Colors.blueGrey[900],
    unselectedItemColor: Colors.white,
    onTap: (index) => {
          if (index == 0)
            {}
          else if (index == 1)
            {}
          else if (index == 2)
            {
              Future.delayed(const Duration(seconds: 1), () async {
                SystemNavigator.pop();
              }),
            }
        },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        label: '설정',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        label: '홈으로',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.highlight_off,
          color: Colors.white,
        ),
        label: '종료',
      )
    ]);

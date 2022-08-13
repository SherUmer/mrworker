import 'package:flutter/material.dart';
import 'package:mr_worker/authScreen.dart';
import 'package:provider/provider.dart';

import '../Aut/SettingPage.dart';
import '../Database.dart';
import '../Details/detailpage.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    return BottomNavigationBar(
      onTap: (int i) {
        if (i == 1) {
          print('Workers');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const detailpage(
                curl: '',
              ),
            ),
          );
        }
        if (i == 2) {
          print('Setting');
          {
            if (dbclass.isLoggedIn == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthScreen(),
                ),
              );
            }
          }
        }
      },
      backgroundColor: const Color(0xFFEBECED),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFa51b1f),
      unselectedItemColor: Colors.black87,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Workers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}

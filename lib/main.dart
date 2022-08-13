import 'package:flutter/material.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/Splash.dart';
import 'package:provider/provider.dart';

import 'Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => DataBase(),
            builder: (context, child) {
              return const MaterialApp(
                title: 'Mr.Worker',
                debugShowCheckedModeBanner: false,
                home: Splash(),
              );
            }),
      ],
    );
  }
}

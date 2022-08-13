import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/Splash.dart';
import 'package:provider/provider.dart';

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
              return MaterialApp(
                title: 'Mr.Worker',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(0xFFECEDEE),
                    primary: const Color(0xFFECEDEE), //<-- SEE HERE
                  ),
                  backgroundColor: const Color(0xFFF5F6F6),
                  primaryColor: const Color(0xFFa51b1f),
                  secondaryHeaderColor: const Color(0xFFa51b1f),
                  // accentColor: const Color(0xFFFE9936),
                  accentColor: const Color(0xFFa51b1f),
                  textTheme: TextTheme(
                    headline1: const TextStyle(
                      color: Color(0xFFa51b1f),
                    ),
                    bodyText1: TextStyle(
                      color: const Color(0xFFa51b1f).withOpacity(0.5),
                    ),
                  ),

                  primaryTextTheme: GoogleFonts.ubuntuCondensedTextTheme(),
                ),
                home: Splash(),
              );
            }),
      ],
    );
  }
}

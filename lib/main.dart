import 'package:flutter/material.dart';
import 'package:week_13/home_page.dart';
import 'package:week_13/home_page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 11, 10, 10),
              minimumSize: const Size(100, 36),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

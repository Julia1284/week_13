import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:week_13/home_page.dart';
import 'package:week_13/home_page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlameAudio.bgm.initialize();
  FlameAudio.bgm.play('fonemusic.mp3', volume: 0.2);

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
              backgroundColor: const Color.fromARGB(255, 11, 10, 10),
              minimumSize: const Size(100, 36),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

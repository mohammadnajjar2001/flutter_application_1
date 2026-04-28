import 'package:flutter/material.dart';
import 'screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF12433B),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF12433B),
          primary: Color(0xFF12433B),
          secondary: Color(0xFF988561),
        ),
        fontFamily: 'Roboto',
      ),
      home: WelcomeScreen(),
    );
  }
}

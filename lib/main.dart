import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_flutter/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displayMedium: TextStyle(
            fontSize: 22,
            fontFamily: GoogleFonts.jua().fontFamily,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
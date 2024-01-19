import 'package:book_worm/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 196, 117, 21)),
        useMaterial3: true,
      ),
      home: const SafeArea(
        child: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controller/api_controller.dart';
import 'package:wallpaper_app/views/screens/detail_page.dart';

import 'views/screens/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => APiController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      routes: {
        '/': (context) => HomePage(),
        'detail_page': (context) => DetailPage(),
      },
    );
  }
}

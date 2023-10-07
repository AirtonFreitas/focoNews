import 'package:flutter/material.dart';

import 'features/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Foco News',
     debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
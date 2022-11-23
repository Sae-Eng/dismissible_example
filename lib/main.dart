import 'package:flutter/material.dart';

import 'dismissible_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dismissible Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DismissibleExample(),
    );
  }
}

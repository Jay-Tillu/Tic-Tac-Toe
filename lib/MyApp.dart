import 'package:flutter/material.dart';

import 'HomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe App",
    );
  }
}

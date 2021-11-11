import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pattern BloC example",
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: const HomePage(),
    );
  }
}
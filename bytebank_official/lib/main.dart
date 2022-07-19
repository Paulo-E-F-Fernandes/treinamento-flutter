import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBankApp());
}

const String data = "Dashboard";

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(data)),
      ),
    );
  }
}

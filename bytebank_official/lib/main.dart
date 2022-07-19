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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/bytebank_logo.png"),
            ),
            Container(
              height: 80,
              width: 120,
              color: Colors.green,
              child: Column(
                children: const [
                  Icon(Icons.people),
                  Text("Contacts"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

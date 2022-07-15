import 'package:flutter/material.dart';

/* *** Versão 001 *** */
void main() {
  runApp(
    Column(
      children: <Widget>[
        const Text(
          'Deliver features faster',
          textDirection: TextDirection.ltr,
        ),
        const Text(
          'Craft beautiful UIs',
          textDirection: TextDirection.ltr,
        ),
        const Text(
          'Craft beautiful UIs #3',
          textDirection: TextDirection.ltr,
        ),
        Column(
          children: const <Widget>[
            Text(
              'Texto 1',
              textDirection: TextDirection.rtl,
            ),
            Text(
              'Texto 2',
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        const Expanded(
          child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: FlutterLogo(),
          ),
        ),
      ],
    ),
  );
}

import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

/* *** Versão 004 *** */
void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          // Esse 900, é um peso que pegamos no site "https://material.io/resources", na parte do "Colors Tools"
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.blueAccent[700],
        ),
        // Esse 700, é um peso que pegamos no site "https://material.io/resources", na parte do "Colors Tools".
        // Normalmente as cores "Accent" são utilizadas para as cores secundárias.
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaTransferencias(),
    );
  }
}

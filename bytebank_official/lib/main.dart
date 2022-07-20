import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBankApp());
}

const String lblContacts = "Contacts";
const String lblDashboard = "Dashboard";

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green[900],
          secondary: Colors.blueAccent[700],
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(lblDashboard)),
      body: Column(
        // O "mainAxisAlignment" ajusta o alinhamento vertical da "Column"
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // O "crossAxisAlignment" ajusta o alinhamento horizontal da "Column"
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // cross < horizontal
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/bytebank_logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 150,
              padding: const EdgeInsets.all(8.0),
              // Quando usamos o "Theme.of(context)", caso o "context" utilizado seja o que está sendo recebido por parâmetro
              // no build "ByteBankApp", estará sendo utilizada as cores do "theme" do widget "ByteBankApp", com isso o "Container"
              // ficará com a cor azul padrão do "MaterialApp"
              // Para utilizarmos a "primary color" que definimos no nosso "theme:", precisaremos extrair o código do nosso "home:"
              // para um novo widget, dessa forma conseguiremos utilizar o "context" correto.
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 32.0,
                  ),
                  Text(
                    lblContacts,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

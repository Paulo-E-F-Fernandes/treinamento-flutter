import 'package:bytebank_official/screens/contacts/list.dart';
import 'package:flutter/material.dart';

const String _lblDashboard = "Dashboard";

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_lblDashboard)),
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
            // O "GestureDetector" é utilizado para implementar as ações de "on..." nos widgets que não possui este
            // comportamento nativamente.
            // O problema que o "GestureDetector" não implementa o efeito de clique no "botão".
            // child: GestureDetector(
            // ----
            // Para implementarmos as ações dos evento "on..." junto com o efeito de clique no botão, devemos trocar o
            // "GestureDetector" pelo "InkWell".
            // O "InkWell" tem o comportamento do "GestureDetector", mas sendo do próprio Material. Para conseguirmos o
            // efeito de clique no "botão", precisamos envolver o "InkWell" pelo "Material", e também, não pode ter
            // filhos definido sua própria cor, o "InkWell" que deve definir a cor. Por causa disso, removemos a
            // propriedade "color:" do "Container" e colocamos a definição do "color:" no "Material".
            child: Material(
              color: Theme.of(context).colorScheme.primary,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContactsList(),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  width: 150,
                  padding: const EdgeInsets.all(8.0),
                  // Quando usamos o "Theme.of(context)", caso o "context" utilizado seja o que está sendo recebido por parâmetro
                  // no build "ByteBankApp", estará sendo utilizada as cores do "theme" do widget "ByteBankApp", com isso o "Container"
                  // ficará com a cor azul padrão do "MaterialApp"
                  // Para utilizarmos a "primary color" que definimos no nosso "theme:", precisaremos extrair o código do nosso "home:"
                  // para um novo widget, dessa forma conseguiremos utilizar o "context" correto.
                  // color: Theme.of(context).colorScheme.primary,
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
                        ContactsList.lblContacts,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

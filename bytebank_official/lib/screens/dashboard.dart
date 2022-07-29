import 'package:bytebank_official/screens/contacts/contacts_list.dart';
import 'package:bytebank_official/screens/transactions_list.dart';
import 'package:bytebank_official/screens/transfer/transfer_list.dart';
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
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _FeatureItem(
                  ContactsList.lblContacts,
                  ContactsList.iconContacts,
                  onClick: () => _showContactsList(context),
                ),
                _FeatureItem(
                  TransferList.lblTransfer,
                  TransferList.iconTransfer,
                  onClick: () => _showTransferList(context),
                ),
                _FeatureItem(
                  "Transaction Feed",
                  Icons.description,
                  onClick: () => _showTransactionsList(context),
                ),
              ],
            ),
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       _FeatureItem(
          //         ContactsList.lblContacts,
          //         ContactsList.iconContacts,
          //         onClick: () => _showContactsList(context),
          //       ),
          //       _FeatureItem(
          //         TransferList.lblTransfer,
          //         TransferList.iconTransfer,
          //         onClick: () => _showTransferList(context),
          //       ),
          //       _FeatureItem(
          //         "Transaction Feed",
          //         Icons.description,
          //         onClick: () => debugPrint("transaction feed was clicked"),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String _name;
  final IconData _icon;
  // O "Function" determina que é um callback do dart
  final Function onClick;

  const _FeatureItem(this._name, this._icon, {required this.onClick, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          onTap: () => onClick(),
          child: Container(
            // height: 100,
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
              children: [
                Icon(
                  _icon,
                  color: Colors.white,
                  size: 32.0,
                ),
                Text(
                  _name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showContactsList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ContactsList(),
    ),
  );
}

void _showTransferList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const TransferList(),
    ),
  );
}

void _showTransactionsList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => TransactionsList(),
    ),
  );
}

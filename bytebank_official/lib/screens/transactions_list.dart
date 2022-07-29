import 'package:bytebank_official/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  static const lblTransactions = "Transactions";

  final List<Transaction> transactions = [];

  TransactionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(TransactionsList.lblTransactions)),
      body: ListView.builder(
        // "O widget." permite que acessamos as informações do objeto definido com tipo de dados da extensão do "State"
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          final Transaction transaction = transactions[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.monetization_on),
              title: Text(
                transaction.value.toString(),
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transaction.contact.accountNumber.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

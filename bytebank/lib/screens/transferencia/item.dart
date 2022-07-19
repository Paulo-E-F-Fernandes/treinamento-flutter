import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class ItemTranferencia extends StatelessWidget {
  // private
  final Transferencia _transferencia;

  const ItemTranferencia(this._transferencia, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.attach_money),
        title: Text(_transferencia.vlTransferencia.toString()),
        subtitle: Text(_transferencia.nrConta.toString()),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/* *** Versão 003 *** */
void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Transferências'),
          ),
          body: const ListaTransferencias(),
          floatingActionButton: FloatingActionButton(
            onPressed: () => print('teste'),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTranferencia(Transferencia(1000, 100.0)),
        ItemTranferencia(Transferencia(2000, 900.0)),
        ItemTranferencia(Transferencia(3000, 340.0)),
        ItemTranferencia(Transferencia(2000, 200.0)),
        ItemTranferencia(Transferencia(3000, 300.0)),
      ],
    );
  }
}

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

class Transferencia {
  final int nrConta;
  final double vlTransferencia;

  Transferencia(this.nrConta, this.vlTransferencia);
}

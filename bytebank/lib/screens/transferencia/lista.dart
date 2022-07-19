import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/item.dart';
import 'package:flutter/material.dart';

const String _appBarTitle = "Transferências";

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List.empty(growable: true);

  ListaTransferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarTitle),
      ),
      body: ListView.builder(
        // "O widget." permite que acessamos as informações do objeto definido com tipo de dados da extensão do "State"
        itemCount: widget._transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          final Transferencia transferencia = widget._transferencias[index];
          return ItemTranferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const FormularioTransferencias();
            }),
          );

          future.then((transferenciaRecebida) => atualiza(transferenciaRecebida));
        },
      ),
    );
  }

  void atualiza(Transferencia? transferenciaRecebida) {
    setState(() {
      if (transferenciaRecebida != null) {
        widget._transferencias.add(transferenciaRecebida);
      }
    });
  }
}

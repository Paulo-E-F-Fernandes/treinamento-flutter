import 'package:flutter/material.dart';

/* *** Versão 004 *** */
void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencias(),
      ),
    );
  }
}

class FormularioTransferencias extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValorTransferencia = TextEditingController();

  FormularioTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando Transferência')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
                labelText: 'Número da Conta',
                hintText: '00000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextField(
              controller: _controladorCampoValorTransferencia,
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.attach_money),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final int? nrConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double? vlTransferencia = double.tryParse(_controladorCampoValorTransferencia.text);

              if (nrConta != null && vlTransferencia != null) {
                Transferencia transferencia = Transferencia(nrConta, vlTransferencia);

                // Exibir a informação no rodapé da página
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$transferencia'),
                  ),
                );
              }
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTranferencia(Transferencia(1000, 100.0)),
          ItemTranferencia(Transferencia(2000, 900.0)),
          ItemTranferencia(Transferencia(3000, 340.0)),
          ItemTranferencia(Transferencia(2000, 200.0)),
          ItemTranferencia(Transferencia(3000, 300.0)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('teste'),
        child: const Icon(Icons.add),
      ),
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

  @override
  String toString() {
    return 'Transferencia {nrConta: $nrConta, vlTransferencia: $vlTransferencia}';
  }
}

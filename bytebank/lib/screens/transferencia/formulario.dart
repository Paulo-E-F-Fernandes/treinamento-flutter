import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const String _appBarTitle = "Criando Transferência";
const String _btnConfirmar = "Confirmar";
const String _nrContaHint = "00000";
const String _nrContaLabel = "Número da Conta";
const String _vlTransferenciaHint = "0.00";
const String _vlTransferenciaLabel = "Valor";

class FormularioTransferencias extends StatefulWidget {
  const FormularioTransferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciasState();
  }
}

class FormularioTransferenciasState extends State<FormularioTransferencias> {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValorTransferencia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_appBarTitle)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(_controladorCampoNumeroConta, _nrContaLabel,
                hintText: _nrContaHint, keyboardType: TextInputType.number),
            Editor(_controladorCampoValorTransferencia, _vlTransferenciaLabel,
                hintText: _vlTransferenciaHint, keyboardType: TextInputType.number, iconData: Icons.attach_money),
            ElevatedButton(
              child: const Text(_btnConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? nrConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? vlTransferencia = double.tryParse(_controladorCampoValorTransferencia.text);

    if (nrConta != null && vlTransferencia != null) {
      Transferencia transferenciaCriada = Transferencia(nrConta, vlTransferencia);

      Navigator.pop(context, transferenciaCriada);

      // Exibir a informação no rodapé da página
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$transferenciaCriada'),
        ),
      );
    }
  }
}

class Transferencia {
  final int nrConta;
  final double vlTransferencia;

  Transferencia(this.nrConta, this.vlTransferencia);

  @override
  String toString() {
    return 'Transferencia {nrConta: $nrConta, vlTransferencia: $vlTransferencia}';
  }
}

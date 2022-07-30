import 'package:http/http.dart';

void findAll() async {
  // Colocar o ip, pois se colocar o "localhost", como estará rodando no celular,
  // vai assumir o "localhost" como o celular e não o computador que está sendo
  // feito o desenvolvimento
  final Response response = await get(Uri(
    scheme: 'http',
    host: ' 192.168.0.149',
    port: 8080,
    path: 'transactions',
  ));
}

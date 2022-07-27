import 'package:bytebank_official/database/app_database.dart';
import 'package:bytebank_official/models/contact.dart';
import 'package:bytebank_official/screens/contacts/contacts_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  static const String lblContacts = "Contacts";

  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(ContactsList.lblContacts)),
      body: FutureBuilder<List<Contact>>(
        initialData: List.empty(growable: true),
        // Precisamos indicar qual é a execução que o "FutureBuilder" vai realizar
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              debugPrint('ConnectionState.none');
              // Nesse estado, o "future" ainda não foi executado.
              // Neste cenário, colocamos algum widget que permita que usuário clique, realize alguma ação para iniciar
              // o "future".
              break;
            case ConnectionState.waiting:
              // Nesse estado, o "future" ainda está carregando.
              // Então, nesse estado, podemos colocar o "loading" de espera de carregamento.
              debugPrint('ConnectionState.waiting');
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
            case ConnectionState.active:
              debugPrint('ConnectionState.active');
              // Nesse estado, o "snapshot" tem algum dado disponível, mas o "Future" ainda não foi finalizado.
              // É utilizado quando temos a abordagem de carregar a tela aos poucos, por exemplo, um download.
              break;
            case ConnectionState.done:
              // Nesse estado, o "Future" foi finalizado.
              final List<Contact>? contacts = snapshot.data;
              debugPrint('ConnectionState.done');
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts![index];
                  return _ContactItem(contact);
                },
                itemCount: contacts?.length,
              );
          }

          return const Text('#ERR001 - Unknown Error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const ContactsForm(),
                ),
              )
              .then((id) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// O "_" como prefixo no nome da classe, define a mesma como classe privada
class _ContactItem extends StatelessWidget {
  final Contact _contact;

  const _ContactItem(this._contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          _contact.fullName,
          style: const TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          _contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

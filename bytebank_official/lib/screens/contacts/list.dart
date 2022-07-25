import 'package:bytebank_official/models/contact.dart';
import 'package:bytebank_official/screens/contacts/form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  static const String lblContacts = "Contacts";
  final List<Contact> contacts = List.empty(growable: true);

  ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(lblContacts)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Contact contact = contacts[index];
          return _ContactItem(contact);
        },
        itemCount: contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const ContactsForm(),
                ),
              )
              .then((newContact) => debugPrint(newContact.toString()));
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

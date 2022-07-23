import 'package:bytebank_official/models/contact.dart';
import 'package:flutter/material.dart';

const String _lblNewContact = "New contact";

class ContactsForm extends StatefulWidget {
  const ContactsForm({Key? key}) : super(key: key);

  @override
  State<ContactsForm> createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_lblNewContact)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                labelText: "Full name",
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: const InputDecoration(
                  labelText: "Account number",
                ),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String fullName = _fullNameController.text;
                    final int? accountNumber = int.tryParse(_accountNumberController.text);

                    if (accountNumber != null) {
                      final Contact newContact = Contact(0, fullName, accountNumber);
                      Navigator.pop(context, newContact);
                    }
                  },
                  child: const Text("Create"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

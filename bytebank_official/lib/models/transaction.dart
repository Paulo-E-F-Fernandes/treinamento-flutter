import 'package:bytebank_official/models/contact.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(this.value, this.contact);

  @override
  String toString() {
    return 'Transaction{contact: $contact, value: $value}';
  }
}

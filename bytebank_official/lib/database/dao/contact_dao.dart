import 'package:bytebank_official/database/app_database.dart';
import 'package:bytebank_official/models/contact.dart';
import 'package:sqflite/sqflite.dart';

//Data Access Object - DAO
class ContactDAO {
  static const String _tableName = 'contacts';
  static const String _tableFieldId = 'id';
  static const String _tableFieldFullName = 'full_name';
  static const String _tableFieldAccountNumber = 'account_number';
  // Usamos o "string template" para usar a constate "tableName" no meio do script de criação da tabela
  static const String createTableSql =
      "CREATE TABLE $_tableName($_tableFieldId INTEGER PRIMARY KEY, $_tableFieldFullName TEXT, $_tableFieldAccountNumber INTEGER)";

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();

    Map<String, dynamic> contactMap = _toMap(contact);
    // Retorna o "id" do registro gerado.
    return db.insert(_tableName, contactMap);

    /*
    return createDatabase().then((db) {
      final Map<String, dynamic> contactMap = {}; // {} ==> Map()
      contactMap['full_name'] = contact.fullName;
      contactMap['account_number'] = contact.accountNumber;
      // Retorna o "id" do registro gerado.
      return db.insert("contacts", contactMap);
    });
    */
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    List<Contact> contacts = _toList(result);

    return contacts;

    /*
    return getDatabase().then((db) {
      return db.query('contacts').then((contactsMapList) {
        final List<Contact> contacts = List.empty(growable: true);

        for (Map<String, dynamic> contactsMap in contactsMapList) {
          final Contact contact = Contact(contactsMap['id'], contactsMap['full_name'], contactsMap['account_number']);
          contacts.add(contact);
        }

        return contacts;
      });
    });
    */
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = {}; // {} ==> Map()
    contactMap[_tableFieldFullName] = contact.fullName;
    contactMap[_tableFieldAccountNumber] = contact.accountNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List.empty(growable: true);

    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(row[_tableFieldId], row[_tableFieldFullName], row[_tableFieldAccountNumber]);
      contacts.add(contact);
    }
    return contacts;
  }
}

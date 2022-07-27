import 'package:bytebank_official/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Referências:
// https://docs.flutter.dev/cookbook/persistence/sqlite
Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    // Set the path to the database.
    // Note: Using the "join" function from the "path" package is best practice to ensure the path is correctly
    // constructed for each platform.
    final String path = join(dbPath, "bytebank.db"); // É uma boa prática colocar a extensão do arquivo como ".db"

    return openDatabase(
      path,
      // When the database is first created, create our table.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        db.execute("CREATE TABLE contacts(id INTEGER PRIMARY KEY, full_name TEXT, account_number INTEGER)");
      },
      // Set the version.
      // This executes the onCreate function and provides a path to perform database upgrades and downgrades.
      version: 1,
      // o "onDowngrade" é executado quando voltamos para uma versão anterior (version:)
      // o "onDatabaseDowngradeDelete" vai limpar os dados do database quando a versão voltar para a anterior
      // Tomar muito cuidado ao utilizar a instrução abaixo
      // onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = {}; // {} ==> Map()
    contactMap['full_name'] = contact.fullName;
    contactMap['account_number'] = contact.accountNumber;
    // Retorna o "id" do registro gerado.
    return db.insert("contacts", contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((contactsMapList) {
      final List<Contact> contacts = List.empty(growable: true);

      for (Map<String, dynamic> contactsMap in contactsMapList) {
        final Contact contact = Contact(contactsMap['id'], contactsMap['full_name'], contactsMap['account_number']);
        contacts.add(contact);
      }

      return contacts;
    });
  });
}

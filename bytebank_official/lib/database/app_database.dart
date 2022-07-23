import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Referências:
// https://docs.flutter.dev/cookbook/persistence/sqlite
void createDatabase() {
  getDatabasesPath().then((dbPath) {
    // Set the path to the database.
    // Note: Using the "join" function from the "path" package is best practice to ensure the path is correctly
    // constructed for each platform.
    final String path = join(dbPath, 'bytebank.db'); // É uma boa prática colocar a extensão do arquivo como ".db"

    openDatabase(
      path,
      // When the database is first created, create our table.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        db.execute('CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER)');
      },
      // Set the version.
      // This executes the onCreate function and provides a path to perform database upgrades and downgrades.
      version: 1,
    );
  });
}

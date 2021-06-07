import 'package:note_app/app/data/model/notes.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String tableName = 'Notes';
  final String columID = 'id';
  final String columTitle = 'title';
  final String columContent = 'content';
  final String columColor = 'colorIndex';
  final String columDateTime = 'dateTime';

  Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initdatabase();
    }
    return _database;
  }

  Future<Database> initdatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + 'Notes.db';
    Database _database = await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) {
        database.execute('''
          CREATE TABLE $tableName (
            $columID INTEGER,
            $columTitle TEXT,
            $columContent TEXT,
            $columColor INTEGER,
            $columDateTime TEXT)
          ''');
      },
    );
    return _database;
  }

  void insertNotes(Notes notes) async {
    Database _database = await this.database;
    await _database.insert(tableName, notes.toMap());
  }

  Future<List<Notes>> getAllNotes() async {
    List<Notes> _listNotes = [];
    Database _database = await this.database;
    try {
      var result = await _database.query(tableName);

      result.forEach((element) {
        Notes _notes = Notes.fromMap(element);
        _listNotes.add(_notes);
      });
    } on DatabaseException catch (e) {
      print('===============' + e.hashCode.toString());
    } catch (e) {}

    return _listNotes;
  }

  Future<int> delete(int id) async {
    var db = await this.database;
    return await db.delete(tableName, where: '$columID = ?', whereArgs: [id]);
  }

  Future<void> deleteAll() async {
    var db = await this.database;
    await db.execute('''DELETE FROM $tableName''');
  }

  Future<int> update(Notes notes) async {
    var db = await this.database;
    return await db.update(
      tableName,
      notes.toMap(),
      where: '$columID = ?',
      whereArgs: [notes.id],
    );
  }
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class BookMarkedData{

  static Database db;

  static Future open() async{
    db = await openDatabase(
        join(await getDatabasesPath() , 'Bookmarks.db'),
        version: 1,
        onCreate: (Database data, int version) {
          data.execute('''

            CREATE TABLE BookMarks(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              description TEXT,
              location TEXT,
              image TEXT
            );

          ''');
        }
    );
  }

  static Future <List<Map<String,dynamic>>> getBookmarkedList() async {
    if (db == null) {
      await open();
    }
    return await db.query('BookMarks', orderBy: 'id');
  }

  static Future insertBookmark(Map<String, dynamic> note) async {
    await db.insert('BookMarks', note);
  }

  static Future deleteBookmark() async {
    await db.delete('BookMarks');
  }
}
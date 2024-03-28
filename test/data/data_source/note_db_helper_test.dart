import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/data/data_source/note_db_hepler.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('db test', () async {

    // db 생성
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await db.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT,'
        'color INTEGER, timestamp INTEGER)');

    final noteDbHelper = NoteDbHelper(db);

    // 인서트 테스트
    await noteDbHelper.insertNote(Note(
      title: 'test',
      content: 'test',
      color: 1,
      timestamp: 1,
    ));
    expect((await noteDbHelper.getNotes()).length, 1);

    Note note = (await noteDbHelper.getNoteById(1))!;
    expect(note.id, 1);

    // 업데이트 테스트
    await noteDbHelper.updateNote(note.copyWith(
      title: 'change'
    ));
    note = (await noteDbHelper.getNoteById(1))!;
    expect(note.title, 'change');

    // 델릿 테스트
    await noteDbHelper.deleteNote(note);
    expect((await noteDbHelper.getNotes()).length, 0);

    await db.close();
  });
}

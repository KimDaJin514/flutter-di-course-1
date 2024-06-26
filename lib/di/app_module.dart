import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@module
abstract class AppModule {
  // 서드파티 의존성 주입은 모듈을 이용
  //Future일 때 preResolve 어노테이션 사용
  @preResolve
  Future<Database> get db => openDatabase(
    'notes_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT,'
          'color INTEGER, timestamp INTEGER)');
    },
  );
}

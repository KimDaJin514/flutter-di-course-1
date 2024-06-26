// import 'package:note_app/data/data_source/note_db_hepler.dart';
// import 'package:note_app/data/repository/note_repository_impl.dart';
// import 'package:note_app/domain/respository/note_repository.dart';
// import 'package:note_app/domain/use_case/add_note_use_case.dart';
// import 'package:note_app/domain/use_case/delete_notes_use_case.dart';
// import 'package:note_app/domain/use_case/get_note_use_case.dart';
// import 'package:note_app/domain/use_case/get_notes_use_case.dart';
// import 'package:note_app/domain/use_case/update_note_use_case.dart';
// import 'package:note_app/domain/use_case/use_cases.dart';
// import 'package:note_app/presentation/add_edit_note/add_edit_note_viewmodel.dart';
// import 'package:note_app/presentation/notes/notes_viewmodel.dart';
// import 'package:provider/provider.dart';
// import 'package:provider/single_child_widget.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
//
// Future<List<SingleChildWidget>> getProviders() async {
//   Database database =
//       await openDatabase('notes_db', version: 1, onCreate: (db, version) async {
//     await db.execute(
//         'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT,'
//         'color INTEGER, timestamp INTEGER)');
//   });
//
//   NoteDbHelper noteDbHelper = NoteDbHelper(database);
//   NoteRepository noteRepository = NoteRepositoryImpl(noteDbHelper);
//   UseCases useCases = UseCases(
//     addNote: AddNoteUseCase(noteRepository),
//     deleteNote: DeleteNoteUseCase(noteRepository),
//     updateNote: UpdateNoteUseCase(noteRepository),
//     getNotes: GetNotesUseCase(noteRepository),
//     getNote: GetNoteUseCase(noteRepository),
//   );
//   NotesViewModel notesViewModel = NotesViewModel(useCases);
//   AddEditNoteViewModel addEditNoteViewModel =
//       AddEditNoteViewModel(noteRepository);
//
//   return [
//     ChangeNotifierProvider(create: (_) => notesViewModel),
//     Provider(create: (_) => noteRepository)
//   ];
// }

import 'package:injectable/injectable.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/respository/note_repository.dart';

@singleton
class GetNoteUseCase {
  final NoteRepository repository;
  GetNoteUseCase(this.repository);

  Future<Note?> call(int id) async {
    return await repository.getNoteById(id);
  }
}
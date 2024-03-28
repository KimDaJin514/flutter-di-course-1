import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/respository/note_repository.dart';

class GetNoteUseCase {
  final NoteRepository repository;
  GetNoteUseCase(this.repository);

  Future<Note?> call(int id) async {
    return await repository.getNoteById(id);
  }
}
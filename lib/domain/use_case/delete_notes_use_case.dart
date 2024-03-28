import 'package:injectable/injectable.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/respository/note_repository.dart';

@singleton
class DeleteNoteUseCase {
  final NoteRepository repository;
  DeleteNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}
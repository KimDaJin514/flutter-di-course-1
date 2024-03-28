import 'package:injectable/injectable.dart';
import 'package:note_app/domain/use_case/add_note_use_case.dart';
import 'package:note_app/domain/use_case/delete_notes_use_case.dart';
import 'package:note_app/domain/use_case/get_note_use_case.dart';
import 'package:note_app/domain/use_case/get_notes_use_case.dart';
import 'package:note_app/domain/use_case/update_note_use_case.dart';

@singleton
class UseCases {
  final AddNoteUseCase addNote;
  final DeleteNoteUseCase deleteNote;
  final UpdateNoteUseCase updateNote;
  final GetNotesUseCase getNotes;
  final GetNoteUseCase getNote;

  UseCases({
    required this.addNote,
    required this.deleteNote,
    required this.updateNote,
    required this.getNotes,
    required this.getNote,
  });
}

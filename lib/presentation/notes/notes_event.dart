import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/util/note_order.dart';

sealed class NotesEvent<T> {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deleteNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote() = RestoreNote;
  const factory NotesEvent.changeOrder(NoteOrder noteOrder) = ChangeOrder;
  const factory NotesEvent.toggleOrderSection() = ToggleOrderSection;
}

class LoadNotes<T> implements NotesEvent<T> {
  const LoadNotes();
}

class DeleteNote<T> implements NotesEvent<T> {
  final Note note;
  const DeleteNote(this.note);
}

class RestoreNote<T> implements NotesEvent<T> {
  const RestoreNote();
}

class ChangeOrder<T> implements NotesEvent<T> {
  final NoteOrder noteOrder;
  const ChangeOrder(this.noteOrder);
}

class ToggleOrderSection<T> implements NotesEvent<T> {
  const ToggleOrderSection();
}
import 'package:injectable/injectable.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/respository/note_repository.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';

@singleton
class GetNotesUseCase {
  final NoteRepository repository;
  GetNotesUseCase(this.repository);

  Future<List<Note>> call(NoteOrder noteOrder) async {
    List<Note> notes = await repository.getNotes();

    switch(noteOrder) {
      case NoteOrderTitle():
        switch(noteOrder.orderType) {
          case Ascending():
            notes.sort((a, b) => a.title.compareTo(b.title));
          case Descending():
            notes.sort((a, b) => -a.title.compareTo(b.title));
        }

      case NoteOrderDate():
        switch(noteOrder.orderType) {
          case Ascending():
            notes.sort((a, b) => a.timestamp.compareTo(b.timestamp));
          case Descending():
            notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
        }

      case NoteOrderColor():
        switch(noteOrder.orderType) {
          case Ascending():
            notes.sort((a, b) => a.color.compareTo(b.color));
          case Descending():
            notes.sort((a, b) => -a.color.compareTo(b.color));
        }
    }

    return notes;
  }
}
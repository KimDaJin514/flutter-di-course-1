import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/respository/title_repository.dart';
import 'package:note_app/domain/use_case/use_cases.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';
import 'package:note_app/presentation/notes/note_state.dart';
import 'package:note_app/presentation/notes/notes_event.dart';

@injectable
class NotesViewModel with ChangeNotifier {
  final UseCases useCases;
  final TitleRepository titleRepository;

  NoteState _state = NoteState(
    order: const NoteOrder.date(OrderType.descending()),
    isOrderSectionVisible: false,
  );

  NoteState get state => _state;

  Note? _recentlyDeletedNote;

  NotesViewModel(
    this.useCases,
    this.titleRepository,
  ) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    switch (event) {
      case LoadNotes():
        _loadNotes();
      case DeleteNote():
        _deleteNote(event.note);
      case RestoreNote():
        _restoreNote();
      case ChangeOrder():
        _changeOrder(event.noteOrder);
      case ToggleOrderSection():
        _toggleOrderSection();
    }
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotes(state.order);

    _state = state.copyWith(notes: notes);

    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNote(note);
    _recentlyDeletedNote = note;

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      await _loadNotes();
    }
  }

  Future<void> _changeOrder(NoteOrder order) async {
    _state = state.copyWith(order: order);

    await _loadNotes();
  }

  Future<void> _toggleOrderSection() async {
    _state = state.copyWith(
      isOrderSectionVisible: !state.isOrderSectionVisible,
    );

    await _loadNotes();
  }
}

sealed class AddEditNoteUiEvent<T> {
  factory AddEditNoteUiEvent.saveNote() = SavedNote;
  factory AddEditNoteUiEvent.showSnackBar(String msg) = ShowSnackBar;
}

class SavedNote<T> implements AddEditNoteUiEvent<T> {
  SavedNote();
}

class ShowSnackBar<T> implements AddEditNoteUiEvent<T> {
  final String msg;
  ShowSnackBar(this.msg);
}
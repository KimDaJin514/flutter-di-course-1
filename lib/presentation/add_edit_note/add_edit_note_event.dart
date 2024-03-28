sealed class AddEditNoteEvent<T> {
  factory AddEditNoteEvent.changeColor(int color) = ChangeColor;
  factory AddEditNoteEvent.saveNote(int? id, String title, String content) = SaveNote;
}

class ChangeColor<T> implements AddEditNoteEvent<T> {
  final int color;
  ChangeColor(this.color);
}

class SaveNote<T> implements AddEditNoteEvent<T> {
  final int? id;
  final String title;
  final String content;
  SaveNote(this.id, this.title, this.content);
}

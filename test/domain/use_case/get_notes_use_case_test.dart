import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/respository/note_repository.dart';
import 'package:note_app/domain/use_case/get_notes_use_case.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';

import 'get_notes_use_case_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  test('sorting func should work well', () async {
    // mockito 라이브러리를 이용해 가짜 NoteRepository 생성
    final repository = MockNoteRepository();
    final getNotes = GetNotesUseCase(repository);

    // 동작 정의
    when(repository.getNotes()).thenAnswer((_) async => [
      Note(
        title: 'title',
        content: 'content',
        color: 1,
        timestamp: 0,
      ),
      Note(
        title: 'title2',
        content: 'content2',
        color: 2,
        timestamp: 2,
      )
    ]);

    List<Note> result = await getNotes(NoteOrder.date(OrderType.descending()));
    expect(result, isA<List<Note>>()); // 타입 검사
    expect(result.first.timestamp, 2);

    verify(repository.getNotes()); // 정말 수행됐는지 확인

    result = await getNotes(NoteOrder.date(OrderType.ascending()));
    expect(result.first.timestamp, 0);

    result = await getNotes(NoteOrder.title(OrderType.descending()));
    expect(result.first.title, 'title2');

    result = await getNotes(NoteOrder.color(OrderType.descending()));
    expect(result.first.color, 2);
  });
}

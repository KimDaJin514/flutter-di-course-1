import 'package:injectable/injectable.dart';
import 'package:note_app/domain/respository/title_repository.dart';

@dev
@Singleton(as: TitleRepository)
class MockTitleRepositoryImpl implements TitleRepository {
  @override
  String getTitle() {
    return '메모앱 (개발용)';
  }

}
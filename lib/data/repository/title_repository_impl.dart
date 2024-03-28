import 'package:injectable/injectable.dart';

import '../../domain/respository/title_repository.dart';

@prod
@Singleton(as: TitleRepository)
class TitleRepositoryImpl implements TitleRepository {
  @override
  String getTitle() {
    return '메모앱';
  }

}


import 'package:forestvpn_test/features/Domain/entities/article.dart';
import 'package:forestvpn_test/features/Domain/repositories/abstract_news_repository.dart';

class LatestPostUseCase {
  AbstractNewsRepository abstractNewsRepository;

  LatestPostUseCase(this.abstractNewsRepository);

  Future<List<Article>> call() async {
    return abstractNewsRepository.getLatestArticles();
  }
}

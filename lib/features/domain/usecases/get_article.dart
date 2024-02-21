import 'package:forestvpn_test/features/Domain/entities/article.dart';
import 'package:forestvpn_test/features/Domain/repositories/abstract_news_repository.dart';

class GetArticleUseCase {
  final AbstractNewsRepository abstractNewsRepository;

  GetArticleUseCase(this.abstractNewsRepository);

  Future<Article> call(id) async {
    return abstractNewsRepository.getArticle(id);
  }
}

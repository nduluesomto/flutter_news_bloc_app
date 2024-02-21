

import 'package:forestvpn_test/features/Domain/entities/article.dart';

abstract class AbstractNewsRepository {
  //Get Latest articles
  Future<List<Article>> getLatestArticles();

  //Get Featured articles
  Future<List<Article>> getFeaturedArticles();

  //Get article by ID
  Future<Article> getArticle(String id);
}

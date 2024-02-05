import 'package:test_uni/data/models/news_article/news_article.dart';

abstract class NewsRepo {
  Future<List<NewsArticle>> fetchNewsArticles(String keyword);
}

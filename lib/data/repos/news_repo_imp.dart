import 'package:dio/dio.dart';
import 'package:test_uni/data/models/news_article/news_article.dart';
import 'package:test_uni/data/repos/news_repo.dart';

class NewsRepoImp implements NewsRepo {
  final Dio dio;

  NewsRepoImp({required this.dio});
  @override
  Future<List<NewsArticle>> fetchNewsArticles(String keyword) async {
    try {
      var responce = await dio.get(
          "https://newsapi.org/v2/everything?q=$keyword&apiKey=4ce493439d5f47459e83c244a223eea9");

      List<NewsArticle> news = [];
      for (var item in responce.data['articles']) {
        news.add(NewsArticle.fromJson(item));
      }
      return news;
    } catch (e) {
      rethrow;
    }
  }
}

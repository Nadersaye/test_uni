import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_uni/data/repos/news_repo.dart';

import '../../../data/models/news_article/news_article.dart';
part 'fetch_news_articles_state.dart';

class FetchNewsArticlesCubit extends Cubit<FetchNewsArticlesState> {
  final NewsRepo newsRepo;
  FetchNewsArticlesCubit(this.newsRepo) : super(FetchNewsArticlesInitial());
  List<NewsArticle> saerchArticles1 = [];
  List<NewsArticle> saerchArticles2 = [];
  execute(String keyword, int searchNumber) async {
    emit(FetchNewsArticlesLoading());
    try {
      final articles = await newsRepo.fetchNewsArticles(keyword);
      if (searchNumber == 1) {
        saerchArticles1 = articles;
      } else {
        saerchArticles2 = articles;
      }
      emit(FetchNewsArticlesSuccess(articles));
    } catch (e) {
      emit(FetchNewsArticlesFailure(e.toString()));
    }
  }
}

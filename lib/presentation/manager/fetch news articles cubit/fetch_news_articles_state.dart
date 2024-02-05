part of 'fetch_news_articles_cubit.dart';

@immutable
sealed class FetchNewsArticlesState {}

final class FetchNewsArticlesInitial extends FetchNewsArticlesState {}

final class FetchNewsArticlesLoading extends FetchNewsArticlesState {}

final class FetchNewsArticlesSuccess extends FetchNewsArticlesState {
  final List<NewsArticle> articles;

  FetchNewsArticlesSuccess(this.articles);
}

final class FetchNewsArticlesFailure extends FetchNewsArticlesState {
  final String message;

  FetchNewsArticlesFailure(this.message);
}

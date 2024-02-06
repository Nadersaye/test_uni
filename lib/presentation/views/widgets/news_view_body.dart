import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_uni/presentation/views/widgets/custom_search_text_field.dart';

import '../../../data/models/news_article/news_article.dart';
import '../../manager/fetch news articles cubit/fetch_news_articles_cubit.dart';
import 'custom_news_list_view.dart';

class NewsViewBody extends StatefulWidget {
  const NewsViewBody({super.key});

  @override
  State<NewsViewBody> createState() => _NewsViewBodyState();
}

class _NewsViewBodyState extends State<NewsViewBody> {
  @override
  void initState() {
    BlocProvider.of<FetchNewsArticlesCubit>(context).saerchArticles1 = [];
    BlocProvider.of<FetchNewsArticlesCubit>(context).saerchArticles2 = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomSearchTextField(
              onChanged: (value) {
                BlocProvider.of<FetchNewsArticlesCubit>(context)
                    .execute(value, 1);
              },
            ),
            const SizedBox(height: 20),
            CustomSearchTextField(
              onChanged: (value) {
                BlocProvider.of<FetchNewsArticlesCubit>(context)
                    .execute(value, 2);
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<FetchNewsArticlesCubit, FetchNewsArticlesState>(
                builder: (context, state) {
              if (state is FetchNewsArticlesLoading) {
                return const CircularProgressIndicator();
              } else if (state is FetchNewsArticlesSuccess) {
                BlocProvider.of<FetchNewsArticlesCubit>(context)
                    .saerchArticles1 = state.articles;
                return CustomNewsListview(
                    keyword1Results:
                        BlocProvider.of<FetchNewsArticlesCubit>(context)
                            .saerchArticles1);
              } else if (state is FetchNewsArticlesFailure) {
                return Text(state.message);
              } else {
                return const SizedBox();
              }
            }),
            const SizedBox(height: 100),
            BlocBuilder<FetchNewsArticlesCubit, FetchNewsArticlesState>(
                builder: (context, state) {
              if (state is FetchNewsArticlesLoading) {
                return const CircularProgressIndicator();
              } else if (state is FetchNewsArticlesSuccess) {
                BlocProvider.of<FetchNewsArticlesCubit>(context)
                        .saerchArticles2 =
                    BlocProvider.of<FetchNewsArticlesCubit>(context)
                        .saerchArticles2;
                return CustomNewsListview(
                    keyword1Results:
                        BlocProvider.of<FetchNewsArticlesCubit>(context)
                            .saerchArticles1);
              } else if (state is FetchNewsArticlesFailure) {
                return Text(state.message);
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}

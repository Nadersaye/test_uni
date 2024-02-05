import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/news_article/news_article.dart';
import '../../manager/fetch news articles cubit/fetch_news_articles_cubit.dart';

class CustomNewsListview extends StatelessWidget {
  const CustomNewsListview({
    super.key,
    required this.keyword1Results,
  });

  final List<NewsArticle> keyword1Results;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: keyword1Results.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            await BlocProvider.of<FetchNewsArticlesCubit>(context)
                .execute(keyword1Results[index].title ?? 'unknown', 2);
          },
          child: ListTile(
            title: Text(keyword1Results[index].title ?? 'unknown'),
            subtitle: Text(keyword1Results[index].content ?? 'unknown'),
          ),
        );
      },
    );
  }
}

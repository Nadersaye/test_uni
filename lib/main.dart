import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_uni/data/repos/news_repo.dart';
import 'package:test_uni/data/repos/news_repo_imp.dart';
import 'package:test_uni/presentation/manager/fetch%20news%20articles%20cubit/fetch_news_articles_cubit.dart';
import 'package:test_uni/presentation/views/news_view.dart';

void main() {
  runApp(const TestUni());
}

class TestUni extends StatefulWidget {
  const TestUni({super.key});

  @override
  State<TestUni> createState() => _TestUniState();
}

class _TestUniState extends State<TestUni> {
  final NewsRepo newsRepo = NewsRepoImp(dio: Dio());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniTest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => FetchNewsArticlesCubit(newsRepo),
        child: const NewsView(),
      ),
    );
  }
}

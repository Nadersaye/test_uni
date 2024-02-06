import 'package:flutter/material.dart';

import 'widgets/news_view_body.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewsViewBody(),
    );
  }
}

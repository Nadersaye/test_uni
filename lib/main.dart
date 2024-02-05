import 'package:flutter/material.dart';
import 'package:test_uni/presentation/views/news_view.dart';

void main() {
  runApp(const TestUni());
}

class TestUni extends StatelessWidget {
  const TestUni({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniTest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/views/widgets/category_builder.dart';

class SciencesScreen extends StatelessWidget {
  const SciencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoryBuilder(),
    );
  }
}

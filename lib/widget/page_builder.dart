import 'package:flutter/material.dart';

import 'data_builder.dart';

class PageBuilder extends StatelessWidget {
  final formdata;
  final mapAnswers;

  const PageBuilder({
    super.key,
    this.formdata,
    this.mapAnswers,
  });


  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildListDelegate(
        [...dataBuilder(formdata, mapAnswers)],
      ),
    );
  }
}

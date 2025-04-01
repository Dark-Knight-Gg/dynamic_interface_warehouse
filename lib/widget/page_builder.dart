import 'package:flutter/material.dart';

import 'data_builder.dart';
import 'form_screen.dart';

class PageBuilder extends StatelessWidget {
  final Map <String, dynamic> formdata;
  final Map <String, dynamic> mapAnswers;
  final String title;

  const PageBuilder({
    super.key,
    required this.formdata,
    required this.mapAnswers,
    this.title = 'Demo'
  });


  @override
  Widget build(BuildContext context) {
    return formPage();
  }
  Widget formPage(){
    switch(formdata['display']){


      case 'form':
        return FormScreen(title: title,formdata: formdata!['components'],mapAnswers: mapAnswers);
    }
      return const SizedBox(child: Text('Not Found Form Type'),);
  }
}

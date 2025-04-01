import 'package:flutter/material.dart';
import 'package:form_io_builder/utils/utils.dart';

import 'data_builder.dart';

class FormScreen extends StatelessWidget{
  final title;
  final formdata;
  final mapAnswers;
  FormScreen({super.key, this.formdata,this.title,this.mapAnswers});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<bool> _onWillPop(context) async {
    bool close = true;

    close = await showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text("Thoát"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Không'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Có'),
            ),
          ],
        ),
      ),
    );

    return close;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  WillPopScope(
      onWillPop: () => _onWillPop(context),

      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          centerTitle:true ,
          leading: BackButton(),
          // IconButton(
          //     onPressed: () =>Navigator.pop(context),
          //     icon: Icon(
          //       Icons.arrow_back_rounded,
          //       size: 30,
          //       color: Colors.black.withOpacity(0.7),
          //     )),

          title: Text(title),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Column(
            children: [

              Expanded(child: Form(
                  key: formKey,
                  child: ListView.custom(
                      childrenDelegate: SliverChildListDelegate(
                          [
                            ... dataBuilder(formdata, mapAnswers)

                            ,
                            ... [
                              //  const SizedBox(height: 8,),
                            ]


                          ]))))
            ],
          ),
        ),
      ),
    );

  }

}
import 'package:dynamic_interface_warehouse/widget/page_builder.dart';
import 'package:dynamic_interface_warehouse/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPage();
}

class _DefaultPage extends State<DefaultPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Default Page',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          buildPageGenerate(),
        ],
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size(0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 16,
                        color: ColorApp.brand,
                      ),
                    ),
                  ],
                ),
              ),
              // const Spacer(),
              const Flexible(
                  child: Text('Page1',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 16))),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageGenerate() {
    return PageBuilder(
      formdata: data,
      mapAnswers: mapAnswers,
    );
  }

  Map<String, dynamic> mapAnswers = {
    "username": "",
    "password": "",
  };

  final data = {
    "label": "Table",
    "cellAlignment": "left",
    "key": "table",
    "type": "table",
    "input": false,
    "tableView": false,
    "rows": [
      [
        {
          "components": [
            {
              "label": "Text Field",
              "applyMaskOn": "change",
              "tableView": true,
              "validateWhenHidden": false,
              "key": "username",
              "type": "username",
              "input": true
            },
            {
              "label": "Text Field",
              "applyMaskOn": "change",
              "tableView": true,
              "validateWhenHidden": false,
              "key": "password",
              "type": "password",
              "input": true
            }
          ]
        }
      ],
      [
        {
          "components": [
            {
              "label": "Data Grid",
              "reorder": false,
              "addAnotherPosition": "bottom",
              "layoutFixed": false,
              "enableRowGroups": false,
              "initEmpty": false,
              "tableView": false,
              "defaultValue": [{}],
              "validateWhenHidden": false,
              "key": "dataGrid",
              "type": "datagrid",
              "input": true,
              "components": [
                {
                  "label": "Page 1",
                  "key": "navigate",
                  "type": "navigate",
                  "pageRoute": "/Page1",
                },
                {
                  "label": "Page 2",
                  "key": "navigate",
                  "type": "navigate",
                  "pageRoute": "/Page2",
                },
                {
                  "label": "Page 3",
                  "key": "navigate",
                  "type": "navigate",
                  "pageRoute": "/Page3",
                }
              ]
            }
          ]
        }
      ]
    ],
    "numCols": 1,
    "numRows": 2
  };
}

import 'package:dynamic_interface_warehouse/widget/page_builder.dart';
import 'package:dynamic_interface_warehouse/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_io_builder/page_build.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DefaultPage();
}

class _DefaultPage extends State<DemoPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return buildPageGenerate();
  }


  Widget buildPageGenerate() {
    return  PageFormBuilder(
      formData: dataDemo,
      mapAnswers: {},
      title: 'page demo',
    );
  }

  Map<String, dynamic> mapAnswers = {
    "username": "",
    "password": "",
  };

  final dataDemo = {
    "display": "wizard",
    "components": [
      {
        "title": "Thông tin cơ quan tiếp nhận",
        "label": "Page 1",
        "type": "panel",
        "key": "page1",
        "components": [
          {
            "label": "Columns",
            "columns": [
              {
                "components": [
                  {
                    "label": "Tỉnh/thành phố",
                    "widget": "choicesjs",
                    "placeholder": "Chọn Tỉnh/thành phố",
                    "tableView": true,
                    "dataSrc": "url",
                    "data": {
                      "url": "https://ttdl-gateway.vnpt.vn/category/v1/co-quan/get-all-tinh-thanh-pho",
                      "headers": [
                        {
                          "key": "",
                          "value": ""
                        }
                      ]
                    },
                    "valueProperty": "id",
                    "clearOnHide": false,
                    "validate": {
                      "required": true
                    },
                    "validateWhenHidden": false,
                    "errors": {
                      "required": "Bạn chưa chọn Tỉnh/thành phố"
                    },
                    "key": "bndpId",
                    "type": "select",
                    "lazyLoad": false,
                    "selectValues": "data",
                    "disableLimit": false,
                    "noRefreshOnScroll": false,
                    "selectData": {},
                    "input": true
                  }
                ],
                "width": 6,
                "offset": 0,
                "push": 0,
                "pull": 0,
                "size": "md",
                "currentWidth": 6
              },
              {
                "components": [
                  {
                    "label": "Trung tâm việc làm",
                    "widget": "choicesjs",
                    "placeholder": "Chọn Trung tâm việc làm",
                    "tableView": true,
                    "dataSrc": "url",
                    "valueProperty": "id",
                    "template": "template",
                    "refreshOn": "bndpId",
                    "clearOnRefresh": true,
                    "validate": {
                      "required": true
                    },
                    "validateWhenHidden": false,
                    "errors": {
                      "required": "Bạn chưa chọn Trung tâm việc làm"
                    },
                    "key": "coquanXulyId",
                    "type": "select",
                    "selectValues": "data",
                    "disableLimit": false,
                    "limit": 10000,
                    "noRefreshOnScroll": false,
                    "input": true
                  }
                ],
                "width": 6,
                "offset": 0,
                "push": 0,
                "pull": 0,
                "size": "md",
                "currentWidth": 6
              }
            ],
            "key": "columns",
            "type": "columns",
            "input": false,
            "tableView": false
          }
        ],
        "input": false,
        "tableView": false,
        "breadcrumbClickable": true,
        "buttonSettings": {
          "previous": true,
          "cancel": true,
          "next": true
        },
        "navigateOnEnter": false,
        "saveOnEnter": false,
        "scrollToTop": false,
        "collapsible": false,
        "description": "Chưa thực hiện",
        "collapsed": false,
        "showtitleMenu": true,
        "titleMenu": "Các bước thực hiện",
        "customguide": "Hướng dẫn Công dân kiểm tra lại thông tin cơ quan tiếp nhận. Nhấn chọn Tiếp theo và thực hiện các bước để hoàn thành quá trình nộp hồ sơ.",
        "customConditional": "",
        "customperformed": "Đang thực hiện"
      },
/*      {
        "title": "Hình thức nhận kết quả hồ sơ",
        "label": "Page 7",
        "type": "panel",
        "key": "page7",
        "input": false,
        "tableView": false,
        "description": "Đang thực hiện",
        "breadcrumbClickable": true,
        "buttonSettings": {
          "previous": true,
          "cancel": true,
          "next": true
        },
        "navigateOnEnter": false,
        "saveOnEnter": false,
        "scrollToTop": false,
        "collapsible": false,
        "components": [
          {
            "label": "Hình thức nhận hồ sơ",
            "applyMaskOn": "change",
            "hideLabel": true,
            "mask": false,
            "spellcheck": true,
            "tableView": false,
            "inputFormat": "plain",
            "truncateMultipleSpaces": false,
            "validateWhenHidden": false,
            "key": "hinhthucnhanhoso",
            "type": "customhinhthucnhanketqua",
            "input": true
          }
        ],
        "hidden": true,
        "disabled": true
      },*/
/*      {
        "title": "Xem lại hồ sơ và nộp",
        "label": "Page 5",
        "type": "panel",
        "key": "reviewStep",
        "input": false,
        "tableView": false,
        "description": "Chưa thực hiện",
        "breadcrumbClickable": true,
        "buttonSettings": {
          "previous": true,
          "cancel": true,
          "next": true
        },
        "navigateOnEnter": false,
        "saveOnEnter": false,
        "scrollToTop": false,
        "collapsible": false,
        "components": [
          {
            "label": "Custom Preview",
            "tableView": false,
            "validateWhenHidden": false,
            "key": "customPreview",
            "type": "custompreview",
            "input": true
          },
          {
            "label": "HTML",
            "tag": "div",
            "attrs": [
              {
                "attr": "",
                "value": ""
              }
            ],
            "content": "<p><strong>Chọn hình thức ký </strong></p>",
            "refreshOnChange": false,
            "hidden": true,
            "key": "labelHinhthucKy",
            "type": "htmlelement",
            "input": false,
            "tableView": false
          },
          {
            "label": "Radio",
            "optionsLabelPosition": "right",
            "customClass": "change-box",
            "inline": true,
            "hidden": true,
            "hideLabel": true,
            "tableView": false,
            "defaultValue": 1,
            "values": [
              {
                "label": "Tải xuống tờ khai và ký",
                "value": "1",
                "shortcut": ""
              },
              {
                "label": "Ký số",
                "value": "2",
                "shortcut": ""
              }
            ],
            "validateWhenHidden": false,
            "key": "radioKyso",
            "type": "radio",
            "input": true
          },
          {
            "label": "Tờ khai",
            "applyMaskOn": "change",
            "hidden": true,
            "mask": false,
            "spellcheck": true,
            "tableView": false,
            "inputFormat": "plain",
            "truncateMultipleSpaces": false,
            "validateWhenHidden": false,
            "key": "tokhai",
            "conditional": {
              "show": true,
              "when": "radioKyso",
              "eq": "1"
            },
            "type": "customtokhai",
            "input": true
          },
          {
            "label": "Ký số",
            "applyMaskOn": "change",
            "hidden": true,
            "mask": false,
            "spellcheck": true,
            "tableView": false,
            "inputFormat": "plain",
            "truncateMultipleSpaces": false,
            "validateWhenHidden": false,
            "key": "kySo",
            "conditional": {
              "show": true,
              "when": "radioKyso",
              "eq": "2"
            },
            "type": "customsignature",
            "input": true
          },
          {
            "label": "Tôi xin đảm bảo các thông tin khai báo là chính xác và xin chịu trách nhiệm về thông tin đã khai báo",
            "customClass": "required-checkbox",
            "tableView": false,
            "defaultValue": false,
            "validate": {
              "required": true,
              "customMessage": "Hãy xác nhận thông tin khai báo"
            },
            "validateWhenHidden": false,
            "errorLabel": "Hãy xác nhận thông tin khai báo",
            "key": "xacnhankhaibao",
            "type": "checkbox",
            "labelWidth": 100,
            "input": true
          }
        ],
        "showtitleMenu": false,
        "customguide": "<p><span style=\"font-size:16px;\"><strong>Hướng dẫn</strong></span></p><ul><li><span style=\"font-size:14px;\">Công dân thực hiện kiểm tra lại các thông tin trên tờ khai.</span></li><li><span style=\"font-size:14px;\">Nếu các thông tin đã đầy đủ và chính xác, công dân chọn \"Nộp hồ sơ\" để hoàn thành thủ tục. </span></li><li><span style=\"font-size:14px;\">Nếu thông tin còn thiếu hoặc chưa chính xác, công dân chọn \"Quay lại\" hoặc chọn vào bước có thông tin cần sửa trên danh sách các bước thực hiện.</span></li></ul>",
        "customperformed": "Hoàn thành"
      },*/
/*      {
        "title": "Ký số và nộp Hồ sơ",
        "label": "Page 6",
        "type": "panel",
        "key": "page6",
        "input": false,
        "tableView": false,
        "breadcrumbClickable": true,
        "buttonSettings": {
          "previous": false,
          "cancel": false,
          "next": false
        },
        "navigateOnEnter": false,
        "saveOnEnter": false,
        "scrollToTop": false,
        "collapsible": false,
        "hidden": true,
        "disabled": true,
        "components": []
      }*/
    ]
  };
}

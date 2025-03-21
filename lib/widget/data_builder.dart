import 'package:dynamic_interface_warehouse/widget/navigate_action_widget.dart';
import 'package:dynamic_interface_warehouse/widget/table_widget.dart';
import 'package:dynamic_interface_warehouse/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_io_builder/utils/utils.dart';
import 'package:form_io_builder/widgets/image_field.dart';

import 'html_widget.dart';
import 'layout_widget.dart';

List<Widget> dataBuilder(jsons, Map<String, dynamic> map,
    {pType = 1, show = false}) {
  List<Widget> listD = [];
/*  printO("=====================FormListWedgit========List Json  ${jsons}");*/
  if (jsons != null && jsons.length > 0) {
    printO("List Json length ${jsons.length}");
    jsons.forEach((element) {
      listD.add(
        widgetBuilder(element, map, pType, show: show),
      );
    });
  } else {
    listD.add(const SizedBox());
  }

  return listD;
}

Widget widgetBuilder(itemJson, Map<String, dynamic> map, pType,
    {row, show = false}) {
  var widget;

  printO("Widegt Type ${itemJson['type']}  && Label ${itemJson['label']}");
  switch (itemJson['type']) {
    case "columns":
      widget = columns(itemJson, map, show: show);
      break;

    case "table":
      // if(settingRes.formTypeShow.value)
      //   widget = tableShow(ItemJson, map);
      // else
      widget = tableShow(itemJson, map);
      break;

    case "panel":
      widget = panel(itemJson, map, show: show);
      break;

    case "htmlelement":
      widget = htmlElement(itemJson, pType);
      break;

    case "tabs":
      widget = taps(itemJson, map, show: show);

      break;

    case "fieldset":
      widget = fieldSet(itemJson, map, show: show);
      break;

    case "well":
      widget = panel(itemJson, map, show: show);
      break;

    case "content":
      widget = const SizedBox();
      break;

    case "textfield":
      // if(settingRes.formTypeShow.value)
      //    widget =HtmlField(ItemJson, map, pType, row: row);
      //   else
      widget = textFiled(itemJson, map);
      break;

    case "password":
      // if(settingRes.formTypeShow.value)
      //   widget =HtmlField(ItemJson, map, pType, row: row);
      // else
      widget = textFiledPassword(itemJson, map);
      break;
    case "username":
      // if(settingRes.formTypeShow.value)
      //   widget =HtmlField(ItemJson, map, pType, row: row);
      // else
      widget = textFiledUsername(itemJson, map);
      break;
    case "navigate":
      // if(settingRes.formTypeShow.value)
      //   widget =HtmlField(ItemJson, map, pType, row: row);
      // else
      widget = navigateWidget(itemJson, map);
      break;

    case "button":
      widget = const SizedBox();
      break;

    case "tags":
      widget = const SizedBox();
      break;

    case "survey":
      widget = const SizedBox();
      break;

    case "container":
      widget = panel(itemJson, map, show: show);
      break;

    case "datamap":
      widget = const SizedBox();
      break;

    case "datagrid":
      widget = gridDataW(itemJson, map, show: show);
      break;

    case "editgrid":
      widget = panel(itemJson, map, show: show);
      break;

    case 'file':
      widget = image_wedgit(itemJson, map, pType, show: show);
      break;

    default:
      widget = const SizedBox();
      break;
  }
  return widget;
}

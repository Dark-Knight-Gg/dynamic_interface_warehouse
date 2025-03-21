import 'package:dynamic_interface_warehouse/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseNavigateActionWidget extends StatelessWidget {
  const BaseNavigateActionWidget({
    this.icon,
    this.label,
    this.labelSize = 16,
    this.labelColor = ColorApp.color1E2F41,
    this.labelFontWeight = FontWeight.w500,
    required this.pageRoute,
    super.key,
  });

  final IconData? icon;
  final String? label;
  final double labelSize;
  final Color labelColor;
  final FontWeight labelFontWeight;
  final String pageRoute;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, pageRoute);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffF2F3F4),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: icon != null
                ? Icon(
                    icon,
                    size: 24,
                    color: ColorApp.brand,
                  )
                : SvgPicture.asset(
                    'assets/images/ic_default.svg',
                    height: 24,
                    width: 24,
                    fit: BoxFit.fill,
                  ),
          ),
          if (label != null) ...[
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label!,
                style: TextStyle(
                  fontSize: labelSize,
                  color: labelColor,
                  fontWeight: labelFontWeight,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ]
        ],
      ),
    );
  }
}

Widget navigateWidget(Item, Map<String, dynamic> map) {
  return BaseNavigateActionWidget(
    icon: Item['icon'],
    label: Item['label'],
    labelColor: Item['labelColor'],
    labelSize: Item['labelSize'],
    labelFontWeight: Item['labelFontWeight'],
    pageRoute: Item['pageRoute'],
  );
}

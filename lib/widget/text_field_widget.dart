import 'package:flutter/material.dart';

class ColorApp {
  static Color brand = const Color(0xff036BCB);
  static const Color color928E85 = Color(0xFF928E85);
  static const Color colorCCD0D5 = Color(0xffCCD0D5);
  static const Color colorADB5BE = Color(0xffADB5BE);
  static const Color color1E2F41 = Color(0xFF1E2F41);
}

class BaseTextField extends StatefulWidget {
  BaseTextField({
    this.hint = '',
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.isPassword = false,
    this.isShowSuffixIcon = true,
    this.initValue = '',
    super.key,
  });

  final String hint;
  final Function(String vallue)? onChanged;
  final int? maxLines;
  final int? maxLength;
  final bool isPassword;
  final bool isShowSuffixIcon;
  String initValue;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  bool obscureText = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        widget.onChanged?.call(value);
      },
      controller: controller,
      obscureText: obscureText,
      minLines: widget.maxLines,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        suffixIcon: widget.isShowSuffixIcon ? buiSuffixIcon() : null,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: ColorApp.colorCCD0D5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 1, color: ColorApp.brand),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.color928E85.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: ColorApp.colorADB5BE,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget buiSuffixIcon() {
    return InkWell(
      onTap: () {
        if (widget.isPassword) {
          setState(() {
            obscureText = !obscureText;
          });
          return;
        }
        if (controller.text.isNotEmpty) {
          controller.text = '';
          return;
        }
      },
      child: SizedBox(
        width: 8,
        height: 8,
        child: widget.isPassword
            ? (obscureText
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off))
            : (controller.text.isNotEmpty
                ? const Icon(Icons.close)
                : const SizedBox.shrink()),
      ),
    );
  }
}

Widget textFiledPassword(
  Item,
  Map<String, dynamic> map,
) {
  return BaseTextField(
    onChanged: (value) {
      map[Item["key"]] = value;
    },
    maxLines: 1,
    hint: Item['hintTextFiled'],
    isPassword: true,
    initValue: map[Item["key"]],
  );
}

Widget textFiledUsername(
  Item,
  Map<String, dynamic> map,
) {
  return BaseTextField(
    onChanged: (value) {
      map[Item["key"]] = value;
    },
    maxLines: 1,
    hint: Item['hintTextFiled'],
    isPassword: false,
    isShowSuffixIcon: false,
    initValue: map[Item["key"]],
  );
}

Widget textFiled(
  Item,
  Map<String, dynamic> map,
) {
  return BaseTextField(
    hint: Item['hintTextFiled'],
    maxLines: Item['maxLines'],
    onChanged: (value) {
      map[Item["key"]] = value;
    },
    maxLength: Item['maxLength'],
    initValue: map[Item["key"]],
    isPassword: false,
  );
}

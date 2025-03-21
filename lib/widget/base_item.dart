import 'package:flutter/material.dart';

typedef BasicItemCallback = void Function({dynamic value});

abstract class BasicItem extends StatelessWidget {
  const BasicItem({
    super.key,
    this.basicItemCallback,
  });

  final BasicItemCallback? basicItemCallback;
}
enum ActionType{
  onChange,
  navigate,
}

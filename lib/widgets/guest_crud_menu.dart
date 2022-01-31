import 'package:flutter/material.dart';

class IconsMenu {
  static const items = <IconMenu>[
    edit,
    delete,
  ];

  static const edit = IconMenu(
    text: 'Edit',
    icon: Icons.edit,
  );

  static const delete = IconMenu(
    text: 'Delete',
    icon: Icons.delete,
  );
}


class IconMenu {
  final String text;
  final IconData icon;

  const IconMenu({
    required this.text,
    required this.icon,
  });
}


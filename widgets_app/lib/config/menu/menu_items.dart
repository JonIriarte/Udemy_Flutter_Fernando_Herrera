import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final IconData iconData;
  final String link;

  MenuItem(
      {required this.title,
      required this.subtitle,
      required this.iconData,
      required this.link});

  final appMenuItems = <MenuItem>[
    MenuItem(
        title: 'Botones',
        subtitle: 'Varios',
        iconData: Icons.smart_button_outlined,
        link: '/buttons'),
    MenuItem(
        title: 'Tarjetas',
        subtitle: 'Un contenedor estilizado',
        iconData: Icons.credit_card,
        link: '/cards'),
  ];
}

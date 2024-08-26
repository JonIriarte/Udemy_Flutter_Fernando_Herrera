import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final IconData iconData;
  final String link;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.iconData,
      required this.link});
}

final appMenuItems = <MenuItem>[
  const MenuItem(
      title: 'Botones',
      subtitle: 'Varios',
      iconData: Icons.smart_button_outlined,
      link: '/buttons_screen'),
  const MenuItem(
      title: 'Tarjetas',
      subtitle: 'Un contenedor estilizado',
      iconData: Icons.credit_card,
      link: '/cards_screen'),
  const MenuItem(
      title: 'Tutorial',
      subtitle: 'Tutorial introductiorio',
      iconData: Icons.accessibility_new_rounded,
      link: '/app_tutorial_screen'),
  const MenuItem(
      title: 'Progress Indicators',
      subtitle: 'Progress Indicators',
      iconData: Icons.check_circle,
      link: '/progress_screen')
];

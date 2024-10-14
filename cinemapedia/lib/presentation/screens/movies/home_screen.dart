import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text(Environment.theMovieDBKey));
  }
}



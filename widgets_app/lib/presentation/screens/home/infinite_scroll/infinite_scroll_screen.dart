import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  static const routeName = 'infinite_scroll_screen';

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imageIds = [1, 2, 3, 4, 56, 888];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).go(HomeScreen.routeName),
        child: const Icon(Icons.arrow_back_ios),
      ),
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          itemCount: imageIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/loading_cat.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imageIds[index] - 1}/500/300'));
          },
        ),
      ),
    );
  }
}

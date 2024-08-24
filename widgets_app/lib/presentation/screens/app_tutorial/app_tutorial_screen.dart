import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Lorem Ipsum algo',
      'assets/images/dummy_enough_picture_1.jpeg'),
  SlideInfo('Busca la comida', 'Caption BLA BALB LA',
      'assets/images/dummy_enough_picture_2.jpeg'),
  SlideInfo('Busca la comida', 'Caption LLLLOOOOOOOOREM',
      'assets/images/dummy_enough_picture_3.jpeg'),
  SlideInfo('Busca la comida', 'Caption 42',
      'assets/images/dummy_enough_picture_4.png'),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const routeName = 'app_tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && (page >= (slides.length - 1.5))) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
                onPressed: () => GoRouter.of(context).go(HomeScreen.routeName),
                child: const Text('Salir')),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FilledButton(
                      onPressed: () {
                        pageViewController.animateToPage(
                          pageViewController.initialPage,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text('Empezar')))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}

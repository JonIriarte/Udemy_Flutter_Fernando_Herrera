import 'package:animate_do/animate_do.dart';
import 'package:dots_indicator/dots_indicator.dart';
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
  final PageController _pageViewController = PageController(initialPage: 0);
  int page = 0;
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        page = _pageViewController.page?.toInt() ?? 0;
      });

      if (!endReached && (page >= (slides.length - 1.5))) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageViewController,
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
          Positioned(
            bottom: 55,
            left: 0,
            right: 0,
            child: DotsIndicator(
              dotsCount: slides.length,
              position: page,
              decorator: DotsDecorator(
                  color: Colors.lightGreen, activeColor: colors.primary),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                        onPressed: () {
                          _pageViewController.animateToPage(
                            _pageViewController.initialPage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text('Empezar')),
                  ))
              : const SizedBox(),
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

import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    // TODO:  initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final slideshowMovies = ref.watch(moviesSlideshowProvider);

    if (slideshowMovies.isEmpty) return const CircularProgressIndicator();

    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(),
          MoviesSlideshow(movies: slideshowMovies),
        ],
      ),
    );
  }
}

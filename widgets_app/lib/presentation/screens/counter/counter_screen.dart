import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

import '../screens.dart';

class CounterScreem extends ConsumerWidget {
  const CounterScreem({super.key});
  static const routeName = '/counter_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkmode = ref.watch(isDarkModeProvider);

    return Scaffold( 
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).toggle();
              },
              icon: Icon(isDarkmode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            GoRouter.of(context).go(HomeScreen.routeName);
          },
        ),
      ),
      body: Center(
        child: Text(
          'valor: $clickCounter ',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => {
                // ref.read(counterProvider.notifier).state++
                // ref.read(counterProvider.notifier).update((state)=> state+1)
                //With the code generator from Riverpod
                ref.read(counterProvider.notifier).increment()
              }),
    );
  }
}

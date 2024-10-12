
// No code generation from riverpod: 
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final counterProvider = StateProvider<int>((ref) => 10);

//With code generation from riverpod
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 10; // Initial counter value is 10
  }

  void increment() {
    state++;
  }
}

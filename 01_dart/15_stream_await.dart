void main() {
  emitNumbers().listen((value) {
    print(value);
  });
}

Stream emitNumbers() async* {
  final valuesToEmit = [1, 2, 3, 4, 5, 6];

  for (int i in valuesToEmit) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

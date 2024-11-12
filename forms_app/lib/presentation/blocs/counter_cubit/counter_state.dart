part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});

  copyWith({required int counter, required int transactionCount}) =>
      CounterState(counter: counter, transactionCount: transactionCount);

  @override
  List<Object> get props => [counter];
}

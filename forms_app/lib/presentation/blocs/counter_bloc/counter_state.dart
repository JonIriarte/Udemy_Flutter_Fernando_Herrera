part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 10, this.transactionCount = 0});

  @override
  List<Object> get props => [counter, transactionCount];

  CounterState copyWith({int? counter, int? transactionCount});
}

final class CounterInitial extends CounterState {
  const CounterInitial({super.counter, super.transactionCount});

  @override
  CounterInitial copyWith({int? counter, int? transactionCount}) =>
      CounterInitial(
          counter: counter ?? this.counter,
          transactionCount: transactionCount ?? this.transactionCount);
}

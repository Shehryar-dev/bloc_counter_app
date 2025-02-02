import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  final int counter;
  const CounterState({this.counter = 10});

  CounterState copyWith({int? count}){
    return CounterState(
      counter: count ?? this.counter
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}
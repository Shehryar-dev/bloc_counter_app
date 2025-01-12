import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable{
  const CounterEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class IncreamentCounter extends CounterEvent{}

class DecrementCounter extends CounterEvent{}
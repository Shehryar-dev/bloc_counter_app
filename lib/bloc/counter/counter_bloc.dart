
import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/bloc/counter/counter_event.dart';
import 'package:bloc_counter_app/bloc/counter/counter_state.dart';

//step 1 is create bloc Class extend with Bloc
//Bloc Class Req Event and CounterState
class CounterBloc extends Bloc<CounterEvent, CounterState>{

  /// CounterBloc Class Constructor with super based,
  /// Counter super() inner CounterStates.....
  CounterBloc() : super(const CounterState()){
    on<IncreamentCounter>(_increament);
    on<DecrementCounter>(_decrement);
  }

  ///_increament function req two parameter IncreamentCounter States, and Emitter Joo k CounterState
  ///apne list instance mei pass krti hai

  void _increament(IncreamentCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(
      count: state.counter + 1
    ));
  }

  ///_decrement function req two parameter IncreamentCounter States, and Emitter Joo k CounterState
  ///apne list instance mei pass krti hai
  void _decrement(CounterEvent event, Emitter <CounterState> emit){
    emit(state.copyWith(
      count:  state.counter -1
    ));
  }
}
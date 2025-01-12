# Bloc Counter App

A simple counter app built using Flutter and BLoC state management. This project demonstrates the use of BLoC pattern to handle state efficiently and cleanly.

---

## Features
- **State Management**: Implemented using the BLoC pattern.
- **Reactive Programming**: Uses Streams to handle state changes.
- **Dynamic Counter**: Increment and decrement the counter with a clean architecture.

---

## Packages Used

| Package Name        | Version |
|---------------------|---------|
| equatable           | ^2.0.7  |
| flutter_bloc        | ^8.1.6  |
| bloc                | ^8.1.4  |

Add these packages to your `pubspec.yaml` file or use the following commands:

```bash
flutter pub add equatable
flutter pub add flutter_bloc
dart pub add bloc
```

---

## Directory Structure

```plaintext
bloc_counter_app/
|-- lib/
    |-- bloc/
        |-- counter/
            |-- counter_bloc.dart
            |-- counter_event.dart
            |-- counter_state.dart
    |-- ui/
        |-- counter_screen.dart
    |-- main.dart
```

---

## Implementation Steps

### Step 1: Install Dependencies
Add the required packages to your project as mentioned above.

### Step 2: Directory Structure
Create two directories:
- `bloc/` for managing BLoC-related files.
- `ui/` for the user interface files.

### Step 3: Counter App UI
Design a simple counter app UI in `ui/counter_screen.dart`.

### Step 4: Counter BLoC
Create three files in the `bloc/counter/` directory:

1. **counter_event.dart**
   ```dart
   import 'package:equatable/equatable.dart';

   abstract class CounterEvent extends Equatable {
     const CounterEvent();

     @override
     List<Object?> get props => [];
   }

   class IncreamentCounter extends CounterEvent {}
   class DecrementCounter extends CounterEvent {}
   ```

2. **counter_state.dart**
   ```dart
   import 'package:equatable/equatable.dart';

   class CounterState extends Equatable {
     final int counter;
     const CounterState({this.counter = 0});

     CounterState copyWith({int? count}) {
       return CounterState(
         counter: count ?? this.counter,
       );
     }

     @override
     List<Object?> get props => [counter];
   }
   ```

3. **counter_bloc.dart**
   ```dart
   import 'package:bloc/bloc.dart';
   import 'counter_event.dart';
   import 'counter_state.dart';

   class CounterBloc extends Bloc<CounterEvent, CounterState> {
     CounterBloc() : super(const CounterState()) {
       on<IncreamentCounter>(_increment);
       on<DecrementCounter>(_decrement);
     }

     void _increment(IncreamentCounter event, Emitter<CounterState> emit) {
       emit(state.copyWith(count: state.counter + 1));
     }

     void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
       emit(state.copyWith(count: state.counter - 1));
     }
   }
   ```

### Step 5: Use BlocProvider in `main.dart`
Wrap the app with `BlocProvider`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter/counter_bloc.dart';
import 'ui/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Bloc Counter App Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const CounterScreen(),
      ),
    );
  }
}
```

### Step 6: Counter Screen
Use `BlocBuilder` to rebuild the UI on state changes:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Counter App')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(IncreamentCounter()),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
```

---

## Run the App
To run the app, use:

```bash
flutter run
```

---

## Download
You can download the source code from [GitHub](#) (Replace `#` with your repository link).

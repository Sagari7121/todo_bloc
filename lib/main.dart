import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_alerts/bloc/todo_bloc.dart';
import 'package:todo_with_alerts/screens/todo_screen.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)
    ),
    
    home: ToDoExample(),
  ));
}


class ToDoExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodoBloc()),   // Your TodoBloc
        // Add additional BLoCs here if needed
        // BlocProvider(create: (_) => AnotherBloc()),
      ],
      child: TodoScreen(),  // Your main screen
    );
  }
}

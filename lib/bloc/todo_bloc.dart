import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_alerts/bloc/todo_event.dart';
import 'package:todo_with_alerts/bloc/todo_state.dart';
import 'package:todo_with_alerts/data/todo_data.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  TodoBloc() : super(InitialState()){
    on<AddNewTodoRequestedEvent> ((event, emit) {
      emit(AddTodoRequestedState());
    },);
    on<SuccessfullyAddedTodoEvent> ((event, emit) async {
      todoData.add(event.todo);
      await Future.delayed(Duration(milliseconds: 1000));
      emit(SuccessfullyAddedTodoState(todoData: todoData));
      print('emitted');
    },);
  }
}
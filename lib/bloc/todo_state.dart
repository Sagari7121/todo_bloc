import 'package:todo_with_alerts/models/todo_ele.dart';

sealed class TodoState {}
class InitialState extends TodoState{}
class AddTodoRequestedState extends TodoState{}
class SuccessfullyAddedTodoState extends TodoState{
  final List<TodoEle> todoData;
  SuccessfullyAddedTodoState({required this.todoData});
}
import 'package:todo_with_alerts/models/todo_ele.dart';

sealed class TodoEvent {}
class InitialEvent extends TodoEvent{}
class AddNewTodoRequestedEvent extends TodoEvent{}
class SuccessfullyAddedTodoEvent extends TodoEvent{
  final TodoEle todo;
  SuccessfullyAddedTodoEvent({required this.todo});
}
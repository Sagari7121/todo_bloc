import 'package:flutter/material.dart';
import 'package:todo_with_alerts/bloc/todo_bloc.dart';
import 'package:todo_with_alerts/data/todo_data.dart';
import 'package:todo_with_alerts/models/todo_ele.dart';
import 'package:todo_with_alerts/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key, required this.todoData});

  final List<TodoEle> todoData;

  final TodoBloc todoBloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [...todoData.map((todo) => TodoItem(todo: todo))],
        );
  }
}

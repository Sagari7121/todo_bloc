import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_alerts/bloc/todo_bloc.dart';
import 'package:todo_with_alerts/bloc/todo_event.dart';
import 'package:todo_with_alerts/bloc/todo_state.dart';
import 'package:todo_with_alerts/models/todo_ele.dart';
import 'package:todo_with_alerts/screens/new_todo.dart';
import 'package:todo_with_alerts/widgets/todo_list.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (cont, state) {
        if (state is AddTodoRequestedState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => NewTodo(cont: context)));
        }
      },
      builder: (context, state) {
        if (state is SuccessfullyAddedTodoState) {
          final List<TodoEle> todoData = state.todoData;
          print('listened!');
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Todo with Alerts',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                     BlocProvider.of<TodoBloc>(context).add(AddNewTodoRequestedEvent());
                  },
                  icon: Icon(Icons.add),
                  color: Colors.white,
                ),
              ],
              backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            body: TodoList(todoData: todoData),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Todo with Alerts',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<TodoBloc>(context).add(AddNewTodoRequestedEvent());
                  },
                  icon: Icon(Icons.add),
                  color: Colors.white,
                ),
              ],
              backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            body: Text('Nothing much'),
          );
        }
      },
    );
  }
}

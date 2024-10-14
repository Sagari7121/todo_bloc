import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_alerts/bloc/todo_bloc.dart';
import 'package:todo_with_alerts/bloc/todo_event.dart';
import 'package:todo_with_alerts/bloc/todo_state.dart';
import 'package:todo_with_alerts/models/todo_ele.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({required this.cont,super.key});
  final BuildContext cont;

  @override
  State<StatefulWidget> createState() {
    return _NewTodoState();
  }
}

class _NewTodoState extends State<NewTodo> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _selectedDeadline;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  void handleDatePicker() async {
    DateTime current = DateTime.now();
    DateTime lastDate = DateTime(current.year + 1, current.month, current.day);
    final date = await showDatePicker(
      context: context,
      firstDate: current,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDeadline = date;
    });
  }

  void onTodoAdd() async {
  if (_titleController.text.trim().isEmpty || 
      _descriptionController.text.trim().isEmpty || 
      _selectedDeadline == null) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Invalid data'),
          content: const Text('Please add all the parameters!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  } else {
    // Dispatch event to add a new ToDo
    final newTodo = TodoEle(
      title: _titleController.text,
      description: _descriptionController.text,
      deadline: _selectedDeadline!,
    );
    widget.cont.read<TodoBloc>().add(SuccessfullyAddedTodoEvent(todo: newTodo));  // Dispatch event here
  }
}


  @override
  Widget build(BuildContext context) {

    return BlocListener(

      listener: (context, state) {
        if(state is SuccessfullyAddedTodoState){
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                TextField(
                  controller: _descriptionController,
                  maxLength: 100,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      _selectedDeadline == null
                          ? 'Deadline'
                          : '${_selectedDeadline!.day.toString()}/${_selectedDeadline!.month.toString()}/${_selectedDeadline!.year.toString()}',
                    ),
                    IconButton(
                      onPressed: handleDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                    TextButton(
                      onPressed: () {
                        onTodoAdd();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

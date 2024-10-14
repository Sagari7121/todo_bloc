import 'package:flutter/material.dart';
import 'package:todo_with_alerts/models/todo_ele.dart';

class TodoItem extends StatefulWidget {
  TodoItem({super.key, required this.todo});

  final TodoEle todo;

  @override
  State<TodoItem> createState() {
    return _TodoItemState();
  }
}

class _TodoItemState extends State<TodoItem> {
  bool? item = false;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: CheckboxListTile(
                title: item == false
                    ? Text(widget.todo.title)
                    : Text(
                        widget.todo.title,
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough),
                      ),
                value: item,
                onChanged: (bool? value) {
                  setState(() {
                    item = value;
                  });
                },
                subtitle: Text('${widget.todo.deadline.day}/${widget.todo.deadline.month}/${widget.todo.deadline.year}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

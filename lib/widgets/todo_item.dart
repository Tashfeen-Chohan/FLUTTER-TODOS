// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_todos/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key,
      required this.todo,
      required this.onTodoChange,
      required this.onDeleteItem});

  final Todo todo;
  final onTodoChange;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        onTap: () => onTodoChange(todo),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.deepPurple,
          size: 25,
        ),
        title: Text(todo.todoTask,
            style: TextStyle(
              decoration: todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            )),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () => onDeleteItem(todo.id),
        ),
      ),
    );
  }
}

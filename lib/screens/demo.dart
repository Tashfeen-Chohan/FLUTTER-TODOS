import 'package:flutter/material.dart';
import 'package:flutter_todos/widgets/todo_item.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          TodoItem(),
          TodoItem(),
          TodoItem(),
          TodoItem(),
        ],
      ),
    );
  }
}

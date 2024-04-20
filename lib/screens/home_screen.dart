import 'package:flutter/material.dart';
import 'package:flutter_todos/models/todo.dart';
import 'package:flutter_todos/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final todoList = Todo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const SearchBar(),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "ALL TODOS",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                for (Todo item in todoList) TodoItem(todo: item)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            title: const Text("Add New Task"),
            content: const TextField(
              decoration: InputDecoration(
                  label: Text("TODO Task"),
                  hintText: "Enter todo task here...",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.task_alt_rounded)),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save"),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                ],
              )
            ],
          );
        });
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      leading: const Icon(Icons.menu),
      title: const Text(
        "TODOS",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: CircleAvatar(
            foregroundImage: AssetImage("assets/profile.jpg"),
            radius: 18,
          ),
        ),
      ],
      centerTitle: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}

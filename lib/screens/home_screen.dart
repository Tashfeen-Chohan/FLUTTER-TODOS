import 'package:flutter/material.dart';
import 'package:flutter_todos/models/todo.dart';
import 'package:flutter_todos/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoList = Todo.todoList();
  List<Todo> _foundTodo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foundTodo = todoList;
  }

  void runFilter(String searchQuery) {
    List<Todo> results = [];
    if (searchQuery.isEmpty) {
      results = _foundTodo;
    } else {
      results = todoList
          .where((element) => element.todoTask
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundTodo = results;
    });
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDeleteItem(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  void _addNewTodo(String newTodo) {
    if (newTodo.isNotEmpty) {
      setState(() {
        todoList.add(
          Todo(id: DateTime.now().toString(), todoTask: newTodo),
        );
      });
      _todoController.clear();
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              contentPadding: EdgeInsets.all(20),
              title: Column(children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                Text(
                  "Error",
                  style: TextStyle(color: Colors.red),
                ),
              ]),
              content: Text(
                "Empty task can't be added!",
                textAlign: TextAlign.center,
              ),
            );
          });
    }
  }

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
          // mySearchBar(runFilter),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) => runFilter(value),
                decoration: const InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),

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
                for (Todo item in _foundTodo.reversed)
                  TodoItem(
                    todo: item,
                    onTodoChange: _handleTodoChange,
                    onDeleteItem: _handleDeleteItem,
                  ),
                const SizedBox(
                  height: 70,
                )
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
                const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            title: Container(
              margin: const EdgeInsets.symmetric(vertical: 13),
              child: const Text(
                "Add New Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            content: TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                  label: Text("TODO Task"),
                  hintText: "Enter todo task here...",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.task_alt_rounded)),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => _addNewTodo(_todoController.text),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white),
                      child: const Text("Save"),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _todoController.clear();
                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                        color: Colors.deepPurple,
                      )),
                      child: const Text("Cancel"),
                    ),
                  ],
                ),
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

Widget mySearchBar() {
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
        // onChanged: (value) => runFilter(value),
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

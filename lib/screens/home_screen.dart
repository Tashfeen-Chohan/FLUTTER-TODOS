import 'package:flutter/material.dart';
import 'package:flutter_todos/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
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
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "ALL TODOS",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                TodoItem(),
                TodoItem(),
                TodoItem(),
              ],
            ),
          ),
        ],
      ),
    );
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

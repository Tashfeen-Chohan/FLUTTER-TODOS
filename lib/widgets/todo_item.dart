import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        onTap: () {},
        leading: const Icon(
          Icons.check_box,
          color: Color.fromARGB(255, 11, 126, 220),
          size: 25,
        ),
        title: const Text("Check Todo Task"),
        trailing: const Icon(
          Icons.delete,
          color: Colors.red,
          size: 30,
        ),
      ),
    );
  }
}

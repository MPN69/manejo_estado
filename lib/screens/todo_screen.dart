import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<String> _toDoList = [];

  void _addItem(String item) {
    setState(() {
      _toDoList.add(item);
    });
  }

  void _removeItem(String item) {
    setState(() {
      _toDoList.remove(item);
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _toDoList.length,
      itemBuilder: (context, int index) {
        final todoItem = _toDoList[index];
        return ListTile(
          title: Text(todoItem),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _removeItem(todoItem),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List App'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Add a new task",
            ),
            onSubmitted: (value) {
              _addItem(value);
            },
          ),
          Expanded(
            child: _buildTodoList(),
          )
        ],
      ),
    );
  }
}

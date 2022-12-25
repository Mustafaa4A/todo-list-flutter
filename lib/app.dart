import 'package:flutter/material.dart';
import 'package:todo_list/data.dart';
import 'package:todo_list/item.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String textField = '';
  List<Todo> items = <Todo>[];

  void addItem(String text) {
    setState(() {
      DateTime now = new DateTime.now();
      Todo item = Todo(text: text, date: now.toString(), checked: false);
      items.add(item);
    });
  }

  void removeItem(Todo item) {
    setState(() {
      items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text('Todo App'),
        leadingWidth: 40,
        leading: CircleAvatar(
          radius: 2,
          backgroundColor: Colors.amber[700],
          child: const Text(
            '4A',
            style: TextStyle(fontSize: 25),
          ),
        ),
        actions: [Icon(Icons.logout)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
            children: items
                .map((item) => Item(
                      item: item,
                      onDelete: removeItem,
                    ))
                .toList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => displayDialog(),
        child: const Icon(Icons.add),
        tooltip: "Add item",
        backgroundColor: Colors.green[500],
      ),
    );
  }

  Future<void> displayDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add new Item'),
            content: TextField(
                decoration:
                    const InputDecoration(hintText: 'Type your new todo'),
                onChanged: (value) {
                  setState(() {
                    textField = value;
                  });
                }),
            actions: [
              TextButton(
                  onPressed: () {
                    if (textField != '') {
                      addItem(textField);
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'))
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list/app.dart';
import 'package:todo_list/data.dart';

class Item extends StatefulWidget {
  const Item({super.key, required this.item, required this.onDelete});

  final Todo item;
  final onDelete;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 85, 70, 70),
            blurRadius: 20,
            spreadRadius: 10),
      ]),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
          child: Text(
            widget.item.text[0],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          widget.item.text,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          'Created on ${widget.item.date}',
          style: const TextStyle(fontSize: 18),
        ),
        trailing: TextButton(
            onPressed: () {
              widget.onDelete(widget.item);
            },
            child: Icon(
              Icons.delete,
              color: Colors.red[600],
            )),
      ),
    );
  }
}

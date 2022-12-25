import 'package:flutter/material.dart';

class myDialog extends StatefulWidget {
  const myDialog({super.key});

  @override
  State<myDialog> createState() => _myDialogState();
}

class _myDialogState extends State<myDialog> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> displayDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add new Item'),
            content: const TextField(
              decoration: const InputDecoration(hintText: 'Type your new todo'),
            ),
            actions: [TextButton(onPressed: () {}, child: Text('Add'))],
          );
        });
  }
}

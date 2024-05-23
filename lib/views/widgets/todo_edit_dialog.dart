import 'package:flutter/material.dart';
import 'package:lesson42/models/todo.dart';

class TodoEditDialog extends StatefulWidget {
  final Todo todo;
  const TodoEditDialog({
    super.key,
    required this.todo,
  });

  @override
  State<TodoEditDialog> createState() => _TodoEditDialogState();
}

class _TodoEditDialogState extends State<TodoEditDialog> {
  final titleController = TextEditingController();
  DateTime? date;

  @override
  void initState() {
    super.initState();

    titleController.text = widget.todo.title;
    date = widget.todo.date;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "Edit Todo",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Title",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date.toString(),
              ),
              TextButton(
                onPressed: () async {
                  date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2300),
                  );
                  setState(() {});
                },
                child: const Text("Select date"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String title = titleController.text;

                  Navigator.pop(context, {
                    "title": title,
                    "date": date,
                  });
                },
                child: const Text("Save"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lesson42/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function() onToggle;
  final Function() onDelete;
  final Function() onEdit;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: onToggle,
        icon: Icon(
          todo.isDone
              ? Icons.check_circle_outline_outlined
              : Icons.circle_outlined,
        ),
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(todo.date.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onEdit,
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: const Text("Are you sure?"),
                    content: Text("You are deleting ${todo.title}"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          onDelete();
                          Navigator.pop(context);
                        },
                        child: const Text("Sure"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}

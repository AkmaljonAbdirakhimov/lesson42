import 'package:flutter/material.dart';
import 'package:lesson42/controllers/todos_controller.dart';
import 'package:lesson42/models/todo.dart';
import 'package:lesson42/views/widgets/todo_edit_dialog.dart';
import 'package:lesson42/views/widgets/todo_item.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  final todosController = TodosController();

  void toggleTodo(int index) {
    todosController.toggleTodo(index);
    setState(() {});
  }

  void delete(int index) {
    todosController.delete(index);
    setState(() {});
  }

  void edit(int index) async {
    Map<String, dynamic>? data = await showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return TodoEditDialog(
          todo: todosController.list[index],
        );
      },
    );

    if (data != null) {
      todosController.edit(index, data['title'], data['date']);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Todos"),
      ),
      body: ListView.builder(
        itemCount: todosController.list.length,
        itemBuilder: (ctx, index) {
          final Todo todo = todosController.list[index];
          return TodoItem(
            todo: todo,
            onToggle: () {
              toggleTodo(index);
            },
            onDelete: () {
              delete(index);
            },
            onEdit: () {
              edit(index);
            },
          );
        },
      ),
    );
  }
}

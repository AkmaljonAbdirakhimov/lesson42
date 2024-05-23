import 'package:lesson42/models/todo.dart';

class TodosController {
  final List<Todo> _list = [
    Todo(
      title: "Go shopping",
      date: DateTime.now(),
    ),
    Todo(
      title: "Go to school",
      date: DateTime.now(),
    ),
  ];

  List<Todo> get list {
    return [..._list];
  }

  void toggleTodo(int index) {
    _list[index].isDone = !_list[index].isDone;
  }

  void delete(int index) {
    _list.removeAt(index);
  }

  void edit(
    int index,
    String newTitle,
    DateTime newDate,
  ) {
    _list[index].title = newTitle;
    _list[index].date = newDate;


    
  }
}

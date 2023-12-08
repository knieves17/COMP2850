import 'package:flutter/material.dart';

import 'package:tasklist/pages/Task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task List',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TaskListPage(),
    );
  }
}

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
// Lista de tareas de ejemplo
  List<Task> tasks = [
    Task(
        title: 'Tarea 1',
        done: true,
        description: 'Terminar tarea Dastas para hoy'),
    Task(title: 'Tarea 2', done: false, description: 'Organizar closet'),
    Task(title: 'Tarea 3', done: false, description: 'Comprar regalo Darren'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task List')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          var task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: task.done
                ? Icon(Icons.check_box, color: Colors.green)
                : Icon(Icons.check_box_outline_blank, color: Colors.red),
            onTap: () {
              setState(() {
                task.done = !task.done;
              });
            },
          );
        },
      ),
    );
  }
}

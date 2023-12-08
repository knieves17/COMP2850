import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:example/pages/todocard.dart';

import 'package:example/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> todos = <Task>[
    Task(
        title: 'Estudiar flutter',
        done: false,
        description: 'Repasar todos los temas del curso'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Center(
          child: Text(
            'T O D O  A P P',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          setState(() {
                            todos.removeAt(index);
                          });
                        },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                  child: TodoCard(
                    todo: todos[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createToDo,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void createToDo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'TODO',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(
              color: Colors.grey,
              height: 4.0,
            ),
            Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                maxLength: 50,
                controller: txtTodoItem,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(),
                maxLines: 2,
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 4.0,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.end,
        actions: [
          MaterialButton(
            color: Colors.grey.shade100,
            textColor: Colors.black,
            onPressed: cancel,
            // style: ButtonStyle(
            //   foregroundColor:
            //       MaterialStateProperty.all<Color>(Colors.black87),
            // ),

            child: const Text('Cancel'),
          ),
          // const SizedBox(
          //   width: 12,
          // ),
          MaterialButton(
            color: Colors.green,
            textColor: Colors.black,
            onPressed: addTodo,
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  TextEditingController txtTodoItem = TextEditingController();

  void addTodoToList(String todoItem) {
    setState(() {
      Task todo = Task(title: todoItem, done: false, description: '');
      todos.insert(0, todo);
    });
  }

  void addTodo() {
    addTodoToList(txtTodoItem.text);
    txtTodoItem.text = '';
    Navigator.pop(context);
  }

  void cancel() {
    txtTodoItem.text = '';
    Navigator.pop(context);
  }
}

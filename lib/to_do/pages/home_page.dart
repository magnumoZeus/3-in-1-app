import 'dart:developer';

import 'package:amaan/to_do/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/database.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void createNewTask() {
    TextEditingController _controller = TextEditingController();

    void saveNewTask() {
      String taskName = _controller.text;

      if (taskName.isNotEmpty) {
        setState(() {
          db.toDoList.add([taskName, false]);
          _controller.clear();
        });
        db.updateDataBase();
        log("message");
        Navigator.of(context).maybePop();
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask, // Pass the custom saveNewTask function
          onCancel: () {
            // Handle cancel action here
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void deleteAllTasks() {
    setState(() {
      db.toDoList.clear();
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        title: const Text('TO - DO', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        //elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            },
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    // spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: IconButton(
                onPressed: deleteAllTasks,
                icon: const Icon(Icons.delete, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

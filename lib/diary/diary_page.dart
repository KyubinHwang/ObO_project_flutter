import 'dart:ui';

import 'package:flutter/material.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  List todos = [];
  String input = "";

  @override
  void initState() {
    super.initState();
    todos.add("빨래하기");
    todos.add("정보처리기사 공부");
    todos.add("알고리즘 풀기");
    todos.add("은행 가기");
  }

  Widget build(BuildContext context) {
    bool _isChecked = false;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: addTaskButton(),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                  title: Text(todos[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              todos.removeAt(index);
                            });
                          }),
                      IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                    ],
                  )

                  // IconButton(
                  //     icon: const Icon(
                  //       Icons.delete_outline_outlined,
                  //       color: Color(0xff5D4F83),
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         todos.removeAt(index);
                  //       });
                  //     }),
                  ),
            );
          }),
    );
  }

  addTaskButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 75),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Task!!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Form(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: TextFormField(
                            validator: (input) => input!.trim().isEmpty
                                ? "Please enter a task."
                                : null,
                            onChanged: (String value) {
                              input = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: '할 일',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          height: 50.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xff5D4F83),
                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  todos.add(input);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ))
                  ],
                )));
      },
      child: const Icon(
        Icons.border_color,
        color: Color(0xff5D4F83),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:obo_project/timeline/timeline_page.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> with AutomaticKeepAliveClientMixin {
  List todos = [];
  List todosDate = [];
  String input = "";
  DateTime _selectedDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    todos.add("빨래하기");
    todos.add("정보처리기사 공부");
    todos.add("알고리즘 풀기");
    todos.add("은행 가기");
    todosDate.add("2022-02-14");
    todosDate.add("2022-02-16");
    todosDate.add("2022-02-17");
    todosDate.add("2022-02-19");
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
                child: StatefulBuilder(
                  builder: (context, _setState) => ListTile(
                      title: Text(todos[index]),
                      subtitle: Text(todosDate[index]),
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
                          Checkbox(
                            activeColor: Color(0xffA67E90),
                            shape: const CircleBorder(),
                            value: _isChecked,
                            onChanged: (bool? value) {
                              _setState(() {
                                _isChecked = value!;
                                if (_isChecked) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TimeLine(
                                                todoTitle: '${todos[index]}',
                                              )));
                                } else {}
                              });
                            },
                          )
                        ],
                      )),
                ));
          }),
    );
  }

  addTaskButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            builder: (BuildContext context) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "할일을 추가해주세요!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: CupertinoDateTextBox(
                            initialValue: DateTime.now(),
                            onDateChange: onDateChangeCallback,
                            hintText: 'Hint Text',
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
                                  todos.add(
                                    input,
                                  );
                                  todosDate.add(DateFormat('yyyy-MM-dd')
                                      .format(_selectedDateTime));
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text(
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

  void onDateChangeCallback(DateTime selectDate) {
    setState(() {
      _selectedDateTime = selectDate;
    });
  }

  @override
  bool get wantKeepAlive => true;
}

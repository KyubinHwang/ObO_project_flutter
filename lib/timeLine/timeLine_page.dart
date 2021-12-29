import 'package:flutter/material.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: new IconTheme(
            data: new IconThemeData(color: Colors.purple[100]),
            child: new Icon(Icons.create_outlined),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: new IconTheme(
            data: new IconThemeData(color: Colors.purple[100]),
            child: new Icon(Icons.calendar_today_outlined),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: new IconTheme(
            data: new IconThemeData(color: Colors.purple[100]),
            child: new Icon(Icons.access_alarm_outlined),
          ),
        ),
      ],
    ));
  }
}

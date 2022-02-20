import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_timeline/flutter_timeline.dart';
import 'package:flutter_timeline/indicator_position.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:obo_project/diary/diary_page.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({Key? key, required this.todoTitle}) : super(key: key);
  final String todoTitle;
  @override
  _TimeLineState createState() => _TimeLineState(todoTitle);
}

class _TimeLineState extends State<TimeLine>
    with AutomaticKeepAliveClientMixin {
  late String todoTitle;
  _TimeLineState(this.todoTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.settings,
        activeIcon: Icons.close,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff5D4F83),
        buttonSize: const Size(62, 62),
        children: [
          SpeedDialChild(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.restore_outlined,
              color: Color(0xff5D4F83),
            ),
            onTap: () => _addEvent(),
          ),
          SpeedDialChild(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.border_color,
              color: Color(0xff5D4F83),
            ),
            onTap: () => _addEvent(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _buildTimeline(),
          Align(
              alignment: Alignment(0.75, 0.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
              ))
        ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    events = [
      smallEventDisplay,
      plainEventDisplay,
    ];
  }

  TimelineEventDisplay get smallEventDisplay {
    return TimelineEventDisplay(
        child: Card(),
        indicatorSize: 12,
        indicator: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: Color(0xff5D4F83)),
        ));
  }

  TimelineEventDisplay get plainEventDisplay {
    return TimelineEventDisplay(
        anchor: IndicatorPosition.top,
        indicatorOffset: Offset(0, 24),
        child: TimelineEventCard(
          padding: const EdgeInsets.only(left: 60, top: 70),
          title: Text("${todoTitle}"),
          content: Text("${DateFormat('yyyy-MM-dd').format(DateTime.now())}"),
        ),
        indicator: TimelineDots.of(context).circleIcon);
  }

  late List<TimelineEventDisplay> events;

  Widget _buildTimeline() {
    return TimelineTheme(
        data: TimelineThemeData(
          lineColor: Color(0xff5D4F83),
          itemGap: 100,
          lineGap: 0,
        ),
        child: Timeline(
          anchor: IndicatorPosition.center,
          indicatorSize: 56,
          altOffset: Offset(10, 40),
          events: events,
        ));
  }

  void _addEvent() {
    setState(() {
      events.add(plainEventDisplay);
    });
  }

  @override
  bool get wantKeepAlive => true;
}

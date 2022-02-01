import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_timeline/flutter_timeline.dart';
import 'package:flutter_timeline/indicator_position.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _buildTimeline(),
      Positioned(
        child: IconButton(
          onPressed: _addEvent,
          icon: Icon(Icons.border_color),
          iconSize: 30,
        ),
      )
    ]);
  }

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
          decoration: BoxDecoration(color: Colors.blueAccent),
        ));
  }

  Widget get randomIndicator {
    var candidates = [
      TimelineDots.of(context).circleIcon,
      Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    ];
    final _random = new Random();
    var element = candidates[_random.nextInt(candidates.length)];
    return element;
  }

  TimelineEventDisplay get plainEventDisplay {
    return TimelineEventDisplay(
        anchor: IndicatorPosition.top,
        indicatorOffset: Offset(0, 24),
        child: TimelineEventCard(
          title: Text("timeline"),
          content: Text("someone commented on your timeline ${DateTime.now()}"),
        ),
        indicator: randomIndicator);
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
}

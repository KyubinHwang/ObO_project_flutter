import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.3,
              indicatorStyle: IndicatorStyle(
                  color: Color(0xff5D4F83), height: 30, width: 30),
              beforeLineStyle: LineStyle(
                color: Color(0xff5D4F83),
              ),
              endChild: Container(
                height: 50,
                width: 80,
                color: Colors.black45,
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.3,
              indicatorStyle: IndicatorStyle(
                  color: Color(0xff5D4F83), height: 30, width: 30),
              beforeLineStyle: LineStyle(
                color: Color(0xff5D4F83),
              ),
              endChild: Container(
                height: 50,
                width: 80,
                color: Colors.black45,
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.3,
              indicatorStyle: IndicatorStyle(
                  color: Color(0xff5D4F83), height: 30, width: 30),
              beforeLineStyle: LineStyle(
                color: Color(0xff5D4F83),
              ),
              endChild: Container(
                height: 50,
                width: 80,
                color: Colors.black45,
              ),
            )
          ],
        ),
      ),
    );
  }
}

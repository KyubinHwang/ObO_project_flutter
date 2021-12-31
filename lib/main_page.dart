import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.pink],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          Positioned(child: _buildAppBar()),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24.0),
                        topLeft: Radius.circular(24.0),
                      )),
                  child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.white70,
                        bottom: TabBar(
                          tabs: [
                            Tab(icon: Icon(Icons.directions_car)),
                            Tab(icon: Icon(Icons.directions_transit)),
                          ],
                        ),
                      ),
                      body: Center(
                          child: TabBarView(children: <Widget>[
                        Tab(icon: Icon(Icons.directions_car)),
                        Tab(icon: Icon(Icons.directions_transit)),
                      ])),
                    ),
                  )))
          // DraggableScrollableSheet(
          //   initialChildSize: 0.4,
          //   maxChildSize: 0.85,
          //   builder: (BuildContext context, ScrollController scrollController) {
          //     return Container(
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(30),
          //         ),
          //         child: ListView(
          //           controller: scrollController,
          //           children: [
          //             CalendarTimeline(
          //               showYears: true,
          //               initialDate: DateTime.now(),
          //               firstDate: DateTime.now().add(Duration(days: -365)),
          //               lastDate: DateTime.now().add(Duration(days: 365)),
          //               onDateSelected: (date) => print(date),
          //               leftMargin: 20,
          //               monthColor: Colors.black,
          //               dayColor: Colors.black,
          //               activeDayColor: Colors.white,
          //               activeBackgroundDayColor: Colors.deepPurple[100],
          //               dotsColor: Colors.black,
          //               selectableDayPredicate: (date) => date.day != 23,
          //             ),
          //           ],
          //         ));
          //   },
          // ),
        ],
      ),
    ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        " ONDO  ",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Image(image: AssetImage('./assets/report_icon.png')),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset('./assets/alarm_icon.png'),
        ),
      ],
    );
  }
}

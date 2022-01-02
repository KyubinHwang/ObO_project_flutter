import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

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
            left: 30,
            top: 180,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "황규빈 님,",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text("당신의 하루를 ON 해보세요",
                      style: TextStyle(fontSize: 25, color: Colors.white))
                ]),
          ),
          SlidingSheet(
            elevation: 10,
            cornerRadius: 16,
            builder: (context, state) {
              return SizedBox(
                  height: 750,
                  child: Center(
                      child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        bottom: const TabBar(
                          tabs: [
                            Tab(
                              icon: Image(
                                  width: 35,
                                  image: AssetImage(
                                    './assets/timeline_icon.png',
                                  )),
                            ),
                            Tab(
                              icon: Image(
                                  width: 35,
                                  image: AssetImage('./assets/diary_icon.png')),
                            ),
                          ],
                        ),
                      ),
                      body: Center(
                          child: TabBarView(children: <Widget>[
                        Tab(
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [
                                Text("타임라인"),
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [
                                Text("타임라인"),
                              ],
                            ),
                          ),
                        ),
                      ])),
                    ),
                  )));
            },
          ),
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
          icon: const Image(
              width: 25, image: AssetImage('./assets/report_icon.png')),
        ),
        IconButton(
          onPressed: () {},
          icon: const Image(
              width: 25, image: AssetImage('./assets/alarm_icon.png')),
        ),
      ],
    );
  }
}

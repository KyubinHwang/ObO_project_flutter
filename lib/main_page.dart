import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:obo_project/timeline/timeline_page.dart';
import 'package:obo_project/diary/diary_page.dart';
import 'package:obo_project/alarm/alarm_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AssetImage switching = const AssetImage('./assets/timeline_icon.png');

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
              colors: [
                Color(0xff3B4383),
                Color(0xff5D4F83),
                Color(0xffA67E90),
                Color(0xffE19EA0),
                Color(0xffF2B18E),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          Positioned(child: _buildAppBar()),
          Positioned(
            left: 30,
            top: 150,
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
            minHeight: 500,
            elevation: 10,
            cornerRadius: 16,
            builder: (context, state) {
              return SingleChildScrollView(
                child: SizedBox(height: 700, child: makeTabController()),
              );
            },
          ),
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
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return Alarm();
            }));
          },
          icon: const Image(
              width: 25, image: AssetImage('./assets/alarm_icon.png')),
        ),
      ],
    );
  }

  makeTabController() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            DateFormat.MEd().format(DateTime.now()),
            style: const TextStyle(color: Color(0xff3B4383), fontSize: 20),
          ),
          toolbarHeight: 20.0,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Color(0xff3B4383),
            indicatorWeight: 3.0,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0),
                insets: EdgeInsets.symmetric(horizontal: 50.0)),
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
                    width: 35, image: AssetImage('./assets/diary_icon.png')),
              ),
            ],
          ),
        ),
        body: const Center(
            child: TabBarView(children: <Widget>[
          Tab(
            child: TimeLine(
              todoTitle: '',
            ),
          ),
          Tab(
            child: Diary(),
          ),
        ])),
      ),
    );
  }
}

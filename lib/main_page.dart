import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'package:obo_project/timeline/timeline_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AssetImage switching = const AssetImage('./assets/timeline_icon.png');

  late TabController _tabController;

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
            elevation: 5,
            cornerRadius: 16,
            builder: (context, state) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: 750,
                  child: DefaultTabController(
                    length: 7,
                    child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      appBar: AppBar(
                        toolbarHeight: 0.0,
                        elevation: 0.0,
                        backgroundColor: Colors.white,
                        bottom: TabBar(
                          indicatorColor: Colors.white,
                          labelColor: Colors.black,
                          isScrollable: true,
                          tabs: List.generate(7, (index) {
                            var now = DateTime.now();
                            var date =
                                DateTime(now.year, now.month, now.day + index);
                            String dateDisplay =
                                DateFormat('MM/dd').format(date);
                            return Tab(text: dateDisplay);
                          }, growable: true),
                        ),
                      ),
                      body: TabBarView(children: <Widget>[
                        makeTabController(),
                        makeTabController(),
                        makeTabController(),
                        makeTabController(),
                        makeTabController(),
                        makeTabController(),
                        makeTabController(),
                      ]),
                    ),
                  ),
                ),
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

  makeTabView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          InkWell(
            onTap: () {
              changing(const AssetImage(
                './assets/timeline_icon.png',
              ));
            },
            child: const Image(
                width: 35,
                image: AssetImage(
                  './assets/timeline_icon.png',
                )),
          ),
          const SizedBox(
            height: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
          Container(
            height: 4,
            width: 80,
            decoration:
                (switching == const AssetImage('./assets/timeline_icon.png'))
                    ? const BoxDecoration(
                        gradient: LinearGradient(
                        colors: [
                          Color(0xff3B4383),
                          Color(0xff5D4F83),
                          Color(0xffA67E90),
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ))
                    : const BoxDecoration(color: Colors.transparent),
          )
        ]),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          InkWell(
            onTap: () {
              changing(const AssetImage(
                './assets/diary_icon.png',
              ));
            },
            child: const Image(
                width: 35,
                image: AssetImage(
                  './assets/diary_icon.png',
                )),
          ),
          const SizedBox(
            height: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
          Container(
            height: 4,
            width: 80,
            decoration:
                (switching == const AssetImage('./assets/diary_icon.png'))
                    ? const BoxDecoration(
                        gradient: LinearGradient(
                        colors: [
                          Color(0xff3B4383),
                          Color(0xff5D4F83),
                          Color(0xffA67E90),
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ))
                    : const BoxDecoration(color: Colors.transparent),
          ),
        ]),
      ],
    );
  }

  changing(AssetImage switchingImage) {
    switching = switchingImage;
    setState(() {});
  }

  makeTabController() {
    return SizedBox(
      height: 650,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 10.0,
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
          body: Center(
              child: TabBarView(children: <Widget>[
            Tab(
              child: SingleChildScrollView(
                child: TimeLine(),
              ),
            ),
            Tab(
              child: Scaffold(
                body: Column(
                  children: const [
                    Text("다이어리"),
                  ],
                ),
              ),
            ),
          ])),
        ),
      ),
    );
  }
}

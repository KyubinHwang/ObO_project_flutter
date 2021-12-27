import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List _pages = [
    Text('TimeLine'),
    Text('Diary'),
    Text('Report'),
    Text('MyPage'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(.50),
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_outlined),
                title: Text('TimeLine')),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined), title: Text('Diary')),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined), title: Text('Report')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                title: Text('MyPage')),
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

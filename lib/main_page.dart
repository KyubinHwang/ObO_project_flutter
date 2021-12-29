import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Image.asset('images/splash.png'),
            // Container(
            //   color: Colors.purple[100],
            // ),
            DraggableScrollableSheet(
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Item $index'));
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        "   ONDO",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.purple[100],
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Image.asset('images/report_icon.png'),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset('images/alarm_icon.png'),
        ),
      ],
    );
  }
}

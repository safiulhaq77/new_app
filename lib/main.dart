import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose(){
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Hello")),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index){
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Container(
                color: Colors.white,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            onItemSelected: (index){
              setState(() {
                _pageController.jumpToPage(index);
              });
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(title: Text("Menu"), icon: Icon(Icons.apps, color: Colors.indigo)),
              BottomNavyBarItem(title: Text("Home"), icon: Icon(Icons.home)),
              BottomNavyBarItem(title: Text("Messages"), icon: Icon(Icons.chat_bubble)),
              BottomNavyBarItem(title: Text("Settings"), icon: Icon(Icons.settings)),
            ]
        ),
      ),
    );
  }
}

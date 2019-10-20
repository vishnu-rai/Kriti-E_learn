import 'package:flutter/material.dart';
import 'page1.dart' as page1;
import 'search.dart' as search;
import 'video.dart' as video;
import 'notif.dart' as notif;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

   int _currentIndex = 1;
  final List<Widget> _children = [search.MyHomePage(title: "d",),page1.MyHomePage(),notif.MyHomePage()];

 void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
  @override
 Widget build(BuildContext context) {
   return Scaffold(
     
     body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
       selectedIconTheme: IconThemeData(color: Color(0xffce1111)),
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.search),
           title: Text('Search'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text('Home'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.notifications),
           title: Text('Notification')
         )
       ],
     ),
   );
 }
}

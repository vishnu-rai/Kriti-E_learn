import 'package:flutter/material.dart';
import 'main.dart' as login;
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'drawer.dart' as drawer;
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;
  ScrollController control;
  bool up = false;
  @override
  void initState() {
    control = ScrollController();
    // control.addListener(_scrollListener);
    super.initState();
    _tabController = TabController(vsync: this, length:2);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }
  widr(DocumentSnapshot str) {
      return FittedBox(
        fit: BoxFit.scaleDown,
        child: GestureDetector(
          // onTap: (){ Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => reader.MyApp(str.data["link"])),
          // );
          // },
          child:  Material(

            //borderRadius: BorderRadius.circular(30.0),

            elevation: 4.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    // height: 174.0,
                    //width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/lol.jpg'),
                            fit: BoxFit.cover))),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 120,
                            ),
                            Text(
                              str.documentID,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19.0,
                                  fontFamily: 'Segoe UI',
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Andrew Ng',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  fontFamily: 'Segoe UI',
                                  color: Colors.grey[700]),
                            ),
                            Text(
                              '29 Jan,2019',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.0,
                                  fontFamily: 'Segoe UI',
                                  color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        Icon(Icons.more_vert,
                            size: 37.0, color: Colors.grey[500]),
                      ],
                    ))
              ],
            )),
      ),);
    }

  @override
  Widget build(BuildContext context) {
     var books = StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("BOOKS")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
       
          return Scaffold(
            body: OrientationBuilder(
              builder: (context, orientation) {
                return GridView.count(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return Padding(padding:EdgeInsets.all(10),child:FittedBox(
                      fit: BoxFit.fitWidth,
                      child:Column(children: <Widget>[
                      Image.network(document.data[
                        'image'
                      ]),
                       ]),),);
                  }).toList(),
                );
              },
            ),
          );
      },
    );
    var ebooks = StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("EBOOKS")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
       
          return Scaffold(
            body: OrientationBuilder(
              builder: (context, orientation) {
                return GridView.count(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return Padding(padding:EdgeInsets.all(10),child:FittedBox(
                      fit: BoxFit.fitWidth,
                      child:Column(children: <Widget>[
                      Image.network(document.data[
                        'image'
                      ]),
                       ]),),);
                  }).toList(),
                );
              },
            ),
          );
      },
    );
    return Scaffold(
      drawer: drawer.drawer(context),
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              iconTheme: new IconThemeData(color: Colors.grey[800]),
              title: Text(
                'Books',
                style: TextStyle(color: Color(0XFF9C9C9C), fontSize: 20.0),
              ),
              backgroundColor: Colors.grey[50],
              actions: <Widget>[
               
               
              ],
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                tabs: <Widget>[
                  Tab(
                    child: Text('physical books',
                        style: TextStyle(color: Colors.grey[800])),
                  ),
                  Tab(
                    child: Text('e books',
                        style: TextStyle(color: Colors.grey[800])),
                  ),
                  
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            books,
            ebooks,
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
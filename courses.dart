import 'package:flutter/material.dart';
import 'main.dart' as login;
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'drawer.dart' as drawer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'video.dart' as video;
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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String titl;
  _MyHomePageState(this.titl);

  TabController _tabController;
  ScrollController _scrollViewController;
  ScrollController control;
  bool up = false;
  @override
  void initState() {
    control = ScrollController();
    // control.addListener(_scrollListener);
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
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
                            // Container(
                            //   height: 120,
                            // ),
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

    reading() {return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("COURSES")
        .document(titl)
          .collection("READINGS")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
       
          return Scaffold(
          body: OrientationBuilder(builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Material(
                    child: widr(document),
                 ),
              );
            }).toList(),
          );}
        ),);
      },
    );}
    
     widu(str) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0,0,0,10),
        child:Stack(
        
        children: <Widget>[
        Column(
          children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Material(
              elevation: 0.0,
              //borderRadius: BorderRadius.circular(6.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          width: 45.0,
                          height: 45.0,
                          decoration: new BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: new DecorationImage(
                              image: AssetImage('assets/lol.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(50.0)),
                            border: new Border.all(
                              color: Color(0xFFB7B5B5),
                              width: 2.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Priyanka Nick Jonas',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                    fontFamily: 'Segoe UI',
                                    color: Colors.grey[900])),
                            Text('about an hour ago',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    fontFamily: 'Segoe UI',
                                    color: Color(0xFF979595))),
                          ],
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: Text(
                          'Andrew NgWe are starting a new hackathaon on web and app development and wish to see you all there on 20 September.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              fontFamily: 'Segoe UI',
                              color: Colors.grey[700]),
                        )),
                    Container(
                      height: 200.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(8.0),
                        image: new DecorationImage(
                          image: AssetImage('assets/lol.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ]),
            ),
          ),
        ])
      ]),);
    }

    
    
    var updates = StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("USER")
          .document('User 1')
          .collection("UPDATES")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
       
          return Scaffold(
          body: OrientationBuilder(builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 1 : 1,
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Material(
                    child: widu(document.documentID),
                  ),
                );
              }).toList(),
            );
          }),
        );
      },
    );
    
    
    widv(DocumentSnapshot str) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => video.ChewieDemo(str.data["link"])),
          );
        },
        child: Material(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            //
            child:
                //  FittedBox(
                //   // fit: BoxFit.scaleDown,
                //   child:
                Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.videocam, color: Colors.grey[900], size: 35.0),
                SizedBox(
                  height: 10.0,
                ),
                // FittedBox(
                // fit: BoxFit.scaleDown,
                // child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            str.documentID,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 19.0,
                                fontFamily: 'Segoe UI',
                                color: Colors.black),
                          ),
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
                    Icon(Icons.more_vert, size: 37.0, color: Colors.grey[500]),
                  ],
                ),
                // ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '4.2',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19.0,
                          fontFamily: 'Segoe UI',
                          color: Colors.grey[500]),
                    ),
                    SizedBox(width: 5.0),
                    Icon(Icons.star, size: 22.0, color: Colors.grey[500]),
                    Spacer(),
                    Icon(Icons.file_download,
                        size: 25.0, color: Colors.grey[500]),
                  ],
                ),
              ],
            ),
            // ),
          ),
        ),
      );
    }

    videos(){return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("COURSES")
          .document(titl)
          .collection("VIDEOS")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
       
          return Scaffold(
          body: OrientationBuilder(builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Material(
                    child: widv(document),
                  ),
                );
              }).toList(),
            );})
          );
      },
    );}
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
                'Home',
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
                    child: Text('Videos',
                        style: TextStyle(color: Colors.grey[800])),
                  ),
                  Tab(
                    child: Text('Reading',
                        style: TextStyle(color: Colors.grey[800])),
                  ),
                  Tab(
                    child: Text('Links',
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
            videos(),
            reading(),
            updates,
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

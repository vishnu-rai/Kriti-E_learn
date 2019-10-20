import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dept1.dart' as next;

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var list = StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection("DEPT").snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) return CircularProgressIndicator();

      return SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Column(
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => next.MyHomePage(
                                title: document.documentID,
                              )),
                    );
                  },
                  child:Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5)
                    ),
                    child: ListTile(title: Text(document.documentID),trailing: Icon(Icons.keyboard_arrow_right),
                  ),),
                ),
              ),
            );
          }).toList(),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body: Center(child:Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10,40,10,10 ),
            child: Text("Departments", textScaleFactor: 2.5),
          ),
          list
        ],
      ),),
     
    ),);
  }
}

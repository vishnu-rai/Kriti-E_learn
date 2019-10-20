import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart' as login;

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool load = false;
bool show = false;

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();
  GlobalKey fabKey = GlobalObjectKey("fab");
  bool load = false;
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('USER')
            .document("SAMPLE")
            .collection('NOTIFICATION')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Scaffold(
                body: Center(child: Image.asset('assets/notif_filler.png')));
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Scaffold(body: Center(child: Text('Loading...')));
            default:
              return Scaffold(
                
                body: (snapshot.data.documents.length == 0)
                    ?  Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0,),
              Row(mainAxisAlignment:MainAxisAlignment.start,
              children:[
                SizedBox(width: 20.0,),
              Text(
                'Notifications',
                style: TextStyle(fontWeight:FontWeight.w600, fontSize:30.0,fontFamily: 'Segoe UI',color:Colors.black),
              ),SizedBox(width: 20.0,),
              
              ]),
              Padding(padding: EdgeInsets.fromLTRB(10,60,10,10),child: Text("No new notificatoins to show",textScaleFactor: 1.3,),)
              ])

                    : ListView(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return
                              // Text("2222");
                              Tile(document.documentID);
                        }).toList(),
                      ),
              );
          }
        });
  }
}

class Tile extends StatefulWidget {
  Tile(this.cname);
  final String cname;
  @override
  TilePage createState() => TilePage(cname);
}

class TilePage extends State<Tile> {
  String cnam;
  DocumentSnapshot item;
  bool load = false;
  TilePage(this.cnam);
  @override
  void initState() {
    super.initState();
    Firestore.instance.collection("USER").document(cnam).get().then((doc) {
      setState(() {
        item = doc;
        load = true;
      });
    });
  }

  Widget build(BuildContext context) {
    return !load
        ? Container()
        : Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 5,
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(item.data['photoURL']),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item.data['uName'],
                                  textScaleFactor: 1.2,
                                ),
                                Text(
                                  "wants to get inspired from you",
                                  textScaleFactor: 0.8,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
  }
}

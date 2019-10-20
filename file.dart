import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'challenges1.dart' as inside;
//import 'initial_challenges1.dart' as inside;
import 'search.dart' as search;
import 'drawer.dart' as drawer;
import 'dart:async';
import 'notification.dart' as notif;
import 'package:highlighter_coachmark/highlighter_coachmark.dart';
import 'dart:async';
import 'main.dart' as login;
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyHomePage());
}

// class MyApp extends StatelessWidget {
//   MyApp({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primaryColor: Colors.white),
//       home: MyHomePage(),
//     );
//   }
// }

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

  login.c3?null:  !show
        ? Timer(Duration(seconds: 1), () {
            show = true;
            print("now  " + show.toString());
            showCoachMarkFAB();
          })
        : null;
  }
  not() {
    int d = 0;
    Firestore.instance
        .collection("USER")
        .document(login.uid)
        .collection("NOTIFICATION")
        .getDocuments()
        .then((a) {
      d = a.documentChanges.length;
      if (d == 0) {
      } else if (!load) {
        setState(() {
          load = true;
        });
      }
    });
    if (!load && d == 0) {
      return Icon(
        Icons.notifications
        ,
        color: Color(0XFF9C9C9C),
      );
    } else
      return Stack(
        children: <Widget>[
          Icon(
            Icons.notifications,
            color: Color(0XFF9C9C9C),
          ),
          Positioned(
            left: 12,
            bottom: 8,
            child: Text(".",
                style: TextStyle(color: Color(0xffe73131), fontSize: 45)),
          )
        ],
      );
  }
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('CATEGORIES').orderBy('order').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Scaffold(body: Center(child: Text('Loading...')));
            default:
              return Scaffold(
                backgroundColor: Colors.grey,
                
                drawer: drawer.drawer(context),
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.grey[800]),
                  backgroundColor: Colors.white,
                  title: Text(
                    'Categories',
                    style: TextStyle(color: Color(0XFF9C9C9C), fontSize: 20.0),
                  ),
                  // backgroundColor: Colors.deepOrange,
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Color(0XFF9C9C9C),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => search.SearchPage()),
                          );
                        }),
                    IconButton(
                      icon: Icon(
                       // not(),
                       Icons.notifications,
                        color: Color(0XFF9C9C9C),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => notif.MyHomePage()),
                        );
                      },
                    // ), IconButton(
                    //   icon: Icon(
                    //     Icons.info_outline,
                    //     color: Color(0XFF9C9C9C),
                    //   ),
                    //   onPressed: () {
                    //     uploadcomplete(context);
                    //   },
                    // ),
                     ), ],
                ),
                body: SafeArea(child:
                // Column(children:<Widget>[
                  ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return  Tile(document.documentID,fabKey);
                  }).toList(),
                ),
                // SizedBox(height:50)
                // ],
                // ),
                ),
              );
          }
        });
  }
uploadcomplete(context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            //shape: RoundedRectangleBorder(
              //  borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: const EdgeInsets.all(20.0),
                height: MediaQuery.of(context).size.height*0.52-50,
                width: MediaQuery.of(context).size.width*0.7,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height:30.0),
                    Text(
                  '1 of 3',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xff5cb0c9)),
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Choose a challenge that intrigues you, lies in your interest.',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w500,
                      fontSize: 19.0,
                      color: Colors.grey[800]),
                ),
                SizedBox(height: 70.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[FlatButton(
                shape: RoundedRectangleBorder(
                  //borderRadius: BorderRadius.circular(30.0),
                ),
                color: Color(0xFFE73131),
                onPressed: () {Navigator.of(context, rootNavigator: true).pop();uploadcomplete1(context);},
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w500,
                      fontSize: 19.0,
                      color: Colors.white),
                ),
              ),],)
                
                
                    
                  ],
                )));
      });
}


uploadcomplete1(context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            //shape: RoundedRectangleBorder(
              //  borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: const EdgeInsets.all(20.0),
                height: MediaQuery.of(context).size.height*0.52-50,
                width: MediaQuery.of(context).size.width*0.7,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height:30.0),
                    Text(
                  '2 of 3',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xff5cb0c9)),
                ),
                SizedBox(height: 20.0,),
                Text(
                  'You can either choose to do the challenge now or save it to do later.',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w500,
                      fontSize: 19.0,
                      color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0,),
                Text(
                  'A notification will be sent to remind you of the challenge ',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Colors.grey[600]),
                ),
                SizedBox(height: 28.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[FlatButton(
                shape: RoundedRectangleBorder(
                  //borderRadius: BorderRadius.circular(30.0),
                ),
                color: Color(0xFFE73131),
                onPressed: () {Navigator.of(context, rootNavigator: true).pop();uploadcomplete2(context);},
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w500,
                      fontSize: 19.0,
                      color: Colors.white),
                ),
              ),],)
                
                
                    
                  ],
                )));
      });
}

uploadcomplete2(context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            //shape: RoundedRectangleBorder(
              //  borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: const EdgeInsets.all(20.0),
                height: MediaQuery.of(context).size.height*0.52-50,
                width: MediaQuery.of(context).size.width*0.7,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height:30.0),
                    Text(
                  '3 of 3',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xff5cb0c9)),
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Earn stars for your each and every achievements as you progress further in this app.',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w500,
                      fontSize: 19.0,
                      color: Colors.grey[800]),
                ),
                SizedBox(height: 70.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[FlatButton(
                shape: RoundedRectangleBorder(
                  //borderRadius: BorderRadius.circular(30.0),
                ),
                color: Color(0xFFE73131),
                onPressed: () {Navigator.of(context, rootNavigator: true).pop();},
                child: Text(
                  'OK',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w500,
                      fontSize: 19.0,
                      color: Colors.white),
                ),
              ),],)
                
                
                    
                  ],
                )));
      });
}
 void showCoachMarkFAB() {
    CoachMark coachMarkFAB = CoachMark(bgColor: Color(0xff2F3962));
    RenderBox target = fabKey.currentContext.findRenderObject();
  
    Rect markRect = target.localToGlobal(Offset.zero) & target.size*0;
    
    coachMarkFAB.show(
        // markShape: BoxShape.rectangle,
        targetContext: fabKey.currentContext,
        markRect: markRect,
        // markShape: BoxShape.rectangle,
        children: [
         Column(children: <Widget>[
         Padding(
           padding: EdgeInsets.fromLTRB(10, 120, 0, 0),
           child: Text(
             "Categories",
             style: (TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600, fontFamily: 'Segoe UI')
           ),
         ),),
         Padding(
           padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
           child: Text("Inspire offers various categories to choose from .Do what you like the most.",
           style: (TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500)),
           ),
         ),Padding(
           padding: EdgeInsets.fromLTRB(25, 200, 25, 0),
           child: Text("Tap anywhere to continue!",
           style: (TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w400)),
           ),
         ),
         ],)
       ],

        duration: null,
        onClose: ()async {
          show = false;
           final prefs = await SharedPreferences.getInstance();
          prefs.setBool("c3", true);
          login.c3=true;
        });
  }


}

class Tile extends StatelessWidget {
  final String document;
  GlobalKey key1;
  Tile(this.document,this.key1);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(child:Column(
        key: document == "Explore" ? key1 : null,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // ListTile(
          // leading:
          Padding(padding: EdgeInsets.only(top: 12.0)),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(document,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    fontFamily: 'Segoe UI',
                    color: Colors.grey[600])),
          ),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Flexible(
                child: MyHome(document),
              ),
            ],
          ),
          // Container(
          //   height: 1.0,
          //   color: Colors.grey[400],
          //   width: MediaQuery.of(context).size.width / 1,
          // )
        ],
      ),),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome(this.cname);
  final String cname;
  @override
  _MyHomePage createState() => _MyHomePage(cname);
}

class _MyHomePage extends State<MyHome> {
  _MyHomePage(this.cnam);
  String cnam;

  Widget build(BuildContext context) {
    bool tim = false;
    // String status='';
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        tim = true;
      });
    });
    return Padding(
      padding:EdgeInsets.fromLTRB(0,0,0,30),
      child: StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("CATEGORIES")
          .document(cnam)
          .collection("SUBCATEGORIES")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        if (tim == false)
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Material(
                    child: card(document),
                  ),
                );
              }).toList(),
            ),
          );
      },
    ),);
  }

  card(DocumentSnapshot name) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => inside.MyHomePage(
                  scat: name.documentID,
                  levela: name['levela'],
                  levelb: name['levelb'],
                  levelc: name['levelc'],
                  leveld: name['leveld'],
                  levele: name['levele'])),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: Image.network(
                name['url'],
                height: 180.0,
                width: 260.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(name.documentID,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    fontFamily: 'Segoe UI',
                    color: Colors.grey[800])),

            // )
          ),
        ],
      ),
    );
  }

  combo(String digit, String a) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 25.0,
          child: Image.asset(
            a,
          ),
        ),
        Text(digit),
      ],
    );
  }
}

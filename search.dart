import 'package:flutter/material.dart';
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
  var userdocs;

  
  void submit(String searchValue) async {
    print("inside submit");
    await Firestore.instance
        .collection("RESOURCES")
        .where('Name',
            isGreaterThanOrEqualTo: searchValue)
        // .where('uName', isLessThan: searchValue.substring(0, 1).toUpperCase())
        .getDocuments()
        .then((a) {
      setState(() {
        print(a.documents.first.data);
        userdocs = a.documents;
        // print(a.documents.first.data);
      });
    });
  }

  ListView buildSearchResults(List<DocumentSnapshot> docs) {
    List<Widget> userSearchItems = [];

    docs.forEach((DocumentSnapshot doc) {
      
      userSearchItems.add(Text(doc.data['Name']));
      userSearchItems.add(SizedBox(
        height: 1,
        child: Container(
          color: Colors.grey[200],
        ),
      ));
    });
    //if (userSearchItems == null)

    return new ListView(
      children: userSearchItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
appBar:

        PreferredSize(
            preferredSize: Size.fromHeight(300),
            child:
                // AppBar(
                //   iconTheme: IconThemeData(color: Colors.grey[800]),
                //   backgroundColor: Colors.white,
                //   title:
                Padding(
              padding: EdgeInsets.all(15),
              child:Column(children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(0,100,200,50),
                child: Text("Search",                style: TextStyle(fontWeight:FontWeight.w600, fontSize:30.0,fontFamily: 'Segoe UI',color:Colors.black),),
                ),
                
                Card(
                
                elevation: 10,
                child: Container(
                  
                  height: 60,
                  child:TextField(
                decoration: new InputDecoration(
                  hoverColor: Colors.black,
                    labelText: 'Search for any resource....',
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(20),
                    borderSide: new BorderSide(
                    color: Colors.black,
                    ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
                // decoration: new InputDecoration(labelText: 'Search for a user...'),
                onSubmitted: submit,
                    onChanged: (string) {
                      submit(string);
                    },
              ),
            ),
                ),],)
               
              ),
            ),
            
          




        body:  
            
            userdocs==null ?  Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 200, 0),
          child: Text(
            "Recent Searches",
            textScaleFactor: 2,
          ),
        ):buildSearchResults(userdocs),),);
        // SizedBox(
        //   height: 20,
        // ),
    //     userdocs==null?Row(
    //       children: <Widget>[
    //         Spacer(),
    //         list(),
    //         Spacer(
    //           flex: 10,
    //         ),
    //       ],
    //     ):Container(),
    //     // Spacer(),
    //       ],
    //     ),
    //   ),
    // );
  }

  list() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("USER")
          .document("User 1")
          .collection('RECENT')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        return SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return Padding(
                padding: EdgeInsets.all(1.5),
                child: Material(
                  child: GestureDetector(
                    child: Text(
                      document.documentID,
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }


}

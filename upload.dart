import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart' as main;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'congo.dart' as congo;
import 'mp.dart' as inside;

class MyHome extends StatefulWidget {
  //  String type,cname,scat,level;
  var image;
  MyHome({Key key, this.image}) : super(key: key);

  @override
  MyHomeState createState() => MyHomeState(
        image,
      );
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  File image;

  MyHomeState(
    this.image,
  );

  TextEditingController myController;
  String description;

  StorageUploadTask task1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: 
      /* AppBar(
        iconTheme: new IconThemeData(color: Colors.grey),
        elevation: 1.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //leading:Icon(icon:Ic),
        actions: <Widget>[
          Theme(
            data: new ThemeData(
              primaryColor: Color(0xffe73131),
              primaryColorDark: Color(0xffe73131),
            ),
            child: RaisedButton(
                onPressed: () {
                  String timenow = DateTime.now().toString();
                  String postname = timenow;

                  print("inside video");

                  final StorageReference firebaseStorageRef1 =
                      FirebaseStorage.instance.ref().child(postname);
                  task1 = firebaseStorageRef1.putFile(image);

                  print("file upload ho gyi");
                  getlink(postname);
                },
                //icon:Icon(Icons.done_all),
                color: Color(0xffe73131),
                child: Text("POST",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        fontFamily: 'Segoe UI',
                        color: Colors.white))

                //highlightedBorderColor: Colors.pinkAccent,

                ),
          )
        ],

        backgroundColor: Colors.white,
      ),
      */ body:  Scaffold(body:ListView(
        children: <Widget>[
          Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0,),
              Row(mainAxisAlignment:MainAxisAlignment.start,
              children:[
                SizedBox(width: 20.0,),
              Text(
                'Add study materials',
                style: TextStyle(fontWeight:FontWeight.w600, fontSize:30.0,fontFamily: 'Segoe UI',color:Colors.black),
              ),]),
              SizedBox(height: 40.0,),
              Container(
                  //height:MediaQuery.of(context).size.height/2,
                  width:MediaQuery.of(context).size.width*0.8,
                  
                  padding: const EdgeInsets.all(10.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
              
              Text('Title'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter title',
                          //suffixIcon: Icon(Icons.account_box,color: Colors.black,),
                        ),
                        ),
                    SizedBox(height:15.0),
                      Text('Description'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter description',
                          //suffixIcon: Icon(Icons.lock_open,color: Colors.black,),
                        ),
                        ),
                      SizedBox(height:15.0),
                      Text('Course'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter core/club',
                          //suffixIcon: Icon(Icons.lock_open,color: Colors.black,),
                        ),
                        ),     ])), 
              
                SizedBox(height:200.0),
                Container(
              height:50.0, 
              width:MediaQuery.of(context).size.width/2,
              child:Material(
                
                borderRadius: BorderRadius.circular(30.0),
                color:Color(0xFFce1111),
                elevation:0.0,
              
                child:FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Color(0xFFce1111),
                onPressed: () {
                  



                  Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => inside.MyHomePage()),
        );
                  String timenow = DateTime.now().toString();
                  String postname = timenow;

                  print("inside video");

                  final StorageReference firebaseStorageRef1 =
                      FirebaseStorage.instance.ref().child(postname);
                  task1 = firebaseStorageRef1.putFile(image);

                  print("file upload ho gyi");
                  getlink(postname);
                },
                child: Text(
                  'Upload',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
              ),

              

            ),)

            ],

          )
        ],
      )
    ),);
  }

  getlink(String postname) async {
    print("inside get link");

    StorageTaskSnapshot downloadUrl1 = await task1.onComplete;
    String url = await downloadUrl1.ref.getDownloadURL() as String;

    print("Link downloaded");

    await Firestore.instance.collection("RESOURCES").document(postname).setData({
      "body": "text",
      // "url": url,
      "timestamp": DateTime.now(),
      "url": url,
      
    });

    print("khatam");
  }
}

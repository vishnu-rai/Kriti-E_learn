import 'package:flutter/material.dart';
import 'mp.dart' as mp;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.grey,
         
    accentColor: Colors.orange,
    hintColor: Colors.green
        
        ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();
  String description, scat, level, tag;
  bool state = false;
  void initState() {
    super.initState();
    state = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
     
      

      body: ListView(
        children: <Widget>[
          Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0,),
              Row(mainAxisAlignment:MainAxisAlignment.start,
              children:[
                SizedBox(width: 20.0,),
              Text(
                'Login',
                style: TextStyle(fontWeight:FontWeight.w600, fontSize:30.0,fontFamily: 'Segoe UI',color:Colors.black),
              ),]),
              SizedBox(height: 40.0,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children:[              Text(
                'User',
                style: TextStyle(fontWeight:FontWeight.w500, fontSize:20.0,fontFamily: 'Segoe UI',color:Colors.black),
              ),     
              Text(
                'Admin',
                style: TextStyle(fontWeight:FontWeight.w500, fontSize:20.0,fontFamily: 'Segoe UI',color:Colors.black),
              ),]),
              SizedBox(height:30.0),
              Container(
                  //height:MediaQuery.of(context).size.height/2,
                  width:MediaQuery.of(context).size.width*0.8,
                  color: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Username'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          suffixIcon: Icon(Icons.account_box,color: Colors.black,),
                        ),
                        ),
                        SizedBox(height:15.0),
                      Text('Password'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '********',
                          suffixIcon: Icon(Icons.lock_open,color: Colors.black,),
                        ),
                        ),SizedBox(height:40.0),
                        
                        
                    ],

                  )
                ),
                SizedBox(height:30.0),
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
                onPressed: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => mp.MyHomePage()),
        );},
                child: Text(
                  'Login',
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
      
    );
  }


    
}

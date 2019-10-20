import 'package:flutter/material.dart';
//import 'main_screen.dart' as ms;


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
        children:[
          Stack(
            children: <Widget>[
              Container(
                height:MediaQuery.of(context).size.height/2 ,
                color: Color(0xFF3C82FE),
                
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  SizedBox(height:40.0,width:MediaQuery.of(context).size.width),
                  
                Container(
                  width: 200.0,
                  height: 140.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage('images/logoadmin.jpg'),
                      fit: BoxFit.cover,
                    ),
                  )
                ),
                  SizedBox(height:10.0),
                Text('Login',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                Container(
                  height:MediaQuery.of(context).size.height/2,
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
                        
                        Container(
              height:50.0, 
              width:MediaQuery.of(context).size.width,
              child:Material(
                
                borderRadius: BorderRadius.circular(30.0),
                color:Color(0xFF3C82FE),
                elevation:0.0,
              
                child:FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Color(0xFF3C82FE),
                onPressed: () {/*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => inside.MyHomePage()),
        );*/},
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Colors.white),
                ),
              ),

              

            ),)
                    ],

                  )
                ),
                
              ]
              )
            ],
          )


        ])
      
    );
  }


    
}

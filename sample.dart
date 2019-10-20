import 'package:flutter/material.dart';

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
  var one= Container(
              height:181.0, 
              width:175.0,
              child:Material(
                
                //borderRadius: BorderRadius.circular(30.0),
                
                elevation:4.0,
              
                child:Padding(
                  padding:const EdgeInsets.all(8.0),
                  child:Column(
                  mainAxisAlignment:MainAxisAlignment.start, 
                  crossAxisAlignment: CrossAxisAlignment.start,               
                  children: <Widget>[
                    Icon(Icons.picture_as_pdf,color:Color(0xffCE1111),size:35.0),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,                      
                          crossAxisAlignment: CrossAxisAlignment.start,                                 
                          children: <Widget>[
                            Text(
                'Lecturenotes',
                style: TextStyle(fontWeight:FontWeight.w500, fontSize:19.0,fontFamily: 'Segoe UI',color:Colors.black),
              ),
              SizedBox(height:5.0),
                  Text(
                'Andrew Ng',
                style: TextStyle(fontWeight:FontWeight.w500, fontSize:15.0,fontFamily: 'Segoe UI',color:Colors.grey[700]),
              ),  Text(
                '29 Jan,2019',
                style: TextStyle(fontWeight:FontWeight.w500, fontSize:11.0,fontFamily: 'Segoe UI',color:Colors.grey[700]),
              ),

                          ],
                        ),
                        Icon(Icons.more_vert, size:37.0,color:Colors.grey[500]),


                    ],),
                    SizedBox(height:30.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        
                            Text(
                '4.2',
                style: TextStyle(fontWeight:FontWeight.w500, fontSize:19.0,fontFamily: 'Segoe UI',color:Colors.grey[500]),
              ),SizedBox(width:5.0),
              Icon(Icons.star, size:22.0,color:Colors.grey[500]),
              SizedBox(width:80.0),
              Icon(Icons.file_download, size:25.0,color:Colors.grey[500]),




                    ],),
                    
                    

                    
                  ],
                ),)

              

            ),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child:Column(children: <Widget>[ 

          
one,

        Container(
          height: 248.0,
          width: 164.0,
          child: FittedBox(

              fit: BoxFit.scaleDown,
              child: Material(

                  //borderRadius: BorderRadius.circular(30.0),

                  elevation: 4.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 174.0,
                          //width:MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/lol.jpg'),
                                  fit: BoxFit.cover))),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Lecturenotes',
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
                  ))),
        ),],)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

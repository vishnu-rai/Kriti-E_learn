import 'package:flutter/material.dart';
import 'mp.dart' as inside;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:';


 final GoogleSignIn googleSignIn = GoogleSignIn();
  signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  // final AuthCredential credential = GoogleAuthProvider.getCredential(
  //   accessToken: googleSignInAuthentication.accessToken,
  //   idToken: googleSignInAuthentication.idToken,
  // );



  print('signInWithGoogle succeeded: $googleSignInAuthentication');
}
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'E learn'),
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
    GoogleSignInAccount googleAccount;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
// final FirebaseAuth auth = FirebaseAuth.instance;
Future<FirebaseUser> _handleSignIn() async {
  Future < FirebaseUser > googleSignin(BuildContext context) async {  
 Future<Null> signInWithGoogle() async {
    
      // Start the sign-in process:
      googleAccount = await googleSignIn.signIn();
    }
    // FirebaseUser firebaseUser = await signIntoFirebase(googleAccount);
    print(googleAccount.displayName);
  } 

}



  

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Scaffold(
     
      

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
                SizedBox(height:20),
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
                onPressed: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => inside.MyHomePage()),
        );},
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
      
    )

      
      ,
        );
  }
}
/* Center( 
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child:Text("next"),
              onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => mp.MyHomePage()),
                      );
                    },
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      */
import 'package:flutter/material.dart';
import 'dept.dart' as dept;
import 'club.dart' as club;
import 'books.dart' as books;
import 'package:image_picker/image_picker.dart';
import 'upload.dart' as post;
import 'package:file_picker/file_picker.dart';
 

String url = '';
String name = '';
pro(context) {
  

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Container(

        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color:Colors.grey[400],
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(url),
          ),
        ),
      ),
      Text(
        "User Name",
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
      ),
    ],
  );
}
Future getpdf(context) async {
   print("uyiu");
    var tempImage = await FilePicker.getFile(type:FileType.CUSTOM,fileExtension: "pdf");

   
 Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return post.MyHome(image:tempImage);
                }),
              );
  }

  Future getImagev(context) async {
   
    var tempImage = await ImagePicker.pickVideo(source: ImageSource.gallery);

   
 Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return post.MyHome(image:tempImage,);
                }),
              );
  }


drawer(context) {
  
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            child: new Wrap(
            children: <Widget>[
new ListTile(
            leading: new Icon(Icons.collections),
            title: new Text('Pdf'),
            onTap: ()  {
                  getpdf(context);
               
            }          
          ),

          new ListTile(
            leading: new Icon(Icons.camera),
            title: new Text('Video'),
            onTap: ()  {

              getImagev(context);


            }          
          ),
          new ListTile(
            leading: new Icon(Icons.videocam),
            title: new Text('Link'),
            onTap: ()  {

              // getImagev();


            }          
          ),
            ],
          ),
          );
      }
    );
}




  return Drawer(
    elevation: 20.0,
    child: Center(child:Column(
      // padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        DrawerHeader(
          child: pro(context),
          decoration: BoxDecoration(
                  // color: Colors.deepOrange,
              ),
        ),
     
        ListTile(
          title: Text('Upload a Resource'),
          leading:Icon(Icons.flag),
          onTap: () {
           _settingModalBottomSheet(context);
          },
        ),
        ListTile(
          title: Text('Departments'),
          leading: Icon(Icons.terrain),
          onTap: () {

                                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => dept.MyHomePage()),
                      );
                    
          },
        ),

        ListTile(
          title: Text('Clubs'),
          leading:Icon(Icons.group_add),
          onTap: () {  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => club.MyHomePage()),
                      );},
        ),
        ListTile(
          title: Text('Books'),
          leading:Icon(Icons.feedback),
          onTap: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => books.MyHomePage()),
                      );
          },
        ),
       
      ],
    ),),
  );
}

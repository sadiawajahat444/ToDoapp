import 'package:flutter/material.dart';
import 'package:toapp/Todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
        title: Center(child: Text("My ToDo App",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
      ),
        body:  Center(
        child: 
         Todo(),
       // Text(
        //  "DRAWER",
        //  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
       // ),
      ),
       drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
                  child:
                   Image.asset( 'assets/images/todobg.jpg', fit: BoxFit.contain,)
             // color: Colors.pink,
            )),
            ListTile(
              title: Text("Setting"),
            ),
            ListTile(
              title: Text("Login"),
            ),
          ],
        ),
      ),
        
        
       //  Todo(),
      ),
    );
  }
}

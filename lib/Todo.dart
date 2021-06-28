import 'package:flutter/material.dart';

class Todo extends StatefulWidget {


  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var input;
  List<dynamic> lst = ["Meeting","Event","Shopping","Appointment","Sports","Travelling","Gym","Entertainment","Coaching","Laundry"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.deepPurple[600],
      body:Stack(
        alignment: Alignment.center,

        children: <Widget>[
          Container(
           // width: 400,
           // height: 600,
            child: Image.asset('assets/images/todobg.jpg', fit: BoxFit.contain,),
          ),

         Positioned(
            child: Text("Todos", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
            top: 40,
            left: 20,
          ),

    //  dragable sheet
      
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            minChildSize: 0.1,
            builder: (BuildContext context, ScrollController scrolController){
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                    ),
                    child: ListView.builder(
     controller: scrolController,
                      itemCount: 20,     
                      
                      itemBuilder: (context, index){
                        return 
                        ListTile(
                   minVerticalPadding: 20.0,
                  title: Text("${lst[index]}",style: TextStyle(color: Colors.purple,fontSize: 22, fontWeight: FontWeight.bold),),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Icon(Icons.edit, color: Colors.purple),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Item",),
                                    content: TextField(
                                      onChanged: (value) {
                                        input = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {input});
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Edit"),
                                           style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                                          
                                          //backgroundColor: Colors.purple),
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                        GestureDetector(
                          child: Icon(Icons.delete, color: Colors.purple),
                          onTap: () {
                            setState(() { lst.removeAt(index); } ) ;   
                          }
                          ),
                      ],  
                    ),
                    ),
                    );
                   
                      }
                        ),
                  ),       

                    Positioned(
                    child: FloatingActionButton(
                      onPressed: (){
                       showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          //backgroundColor: Colors.pink,
                          title: Text("Add Item"),
                          content: TextField(
                            onChanged: (value) {
                              input = value;
                            },
                          ),
                          actions: [
                            ElevatedButton(
                                  onPressed: () {
                                  setState(() {
                                    lst.add(input);
                                  });
                                  Navigator.of(context).pop();
                                },

                                child: Text("Add"),
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),)
                          ],
                        );
                      });
                },
                child:
                     Icon(Icons.add, color: Colors.white,),
                      backgroundColor: Colors.pinkAccent,
                    ),
                    top: -30,
                    right: 100,
                  )
        ], 
          );
          }
          ),
                ],
         ),
      );
  }
  }
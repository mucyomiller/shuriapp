import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class Moredetails extends StatelessWidget {
  final String data;
  Moredetails({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Notifications',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: <Widget>[
                       
                        SizedBox(
                          height: 8,
                        )
                      ],
                    )
                  ],
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${data}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                  color: Colors.grey,
                ),

                Text('Welcome to ----------------------'),
                    SizedBox(
                      height: 12.0,
                    ),
                    
                  
                  ],
                ),
                SizedBox(height: 10.0,),
                Column(
                  children: [
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Expanded(flex:3,child: TextField(decoration: InputDecoration(
                      labelText: "Enter message",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 15.0),
                    ),)),
                    SizedBox(width: 8.0,),
                      Expanded(flex:1,child: OutlineButton(onPressed: null,child: Container(padding:EdgeInsets.all(14.0) ,child: Icon(FontAwesome.reply_all,color:Color(0xFF7B68EE)),),))
                    ],)
                  ],
                )
                

              ],
            ),
          ),
        ));
  }
}

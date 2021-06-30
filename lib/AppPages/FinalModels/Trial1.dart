import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      body: MyApp(),
    ),
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // FractionallySizedBox(
        //   heightFactor: 0.3,
        //   child: Container(color: Colors.blue,),
        // ),

        // FractionallySizedBox(
        //   heightFactor: 0.3,
        //   child: Container(color: Colors.green[200],),

        // ),

        // FractionallySizedBox(
        //   heightFactor: 0.6,
        //   child: Container(color: Colors.teal,),

        // )
      
      Flexible(flex: 3,child : Container(color:Colors.blue)),
      Flexible(flex: 10,child : Container(color:Colors.black)),
      Flexible(flex: 3,child : Container(color:Colors.blue)),
      

      ],

    );
  }
}




class IWantToCreateSomething extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: Container(height: 45,
        ),)
    );
  }
}
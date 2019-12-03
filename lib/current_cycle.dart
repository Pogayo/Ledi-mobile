import 'package:flutter/material.dart';

class CurrentCycle extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _CurrentCycleState();
  }

}
class _CurrentCycleState extends State<CurrentCycle>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(title:Text("Current Cycle")),
      body: Container(
      color: Colors.yellow,
    ));
  }

}
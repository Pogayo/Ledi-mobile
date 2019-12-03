import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';




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
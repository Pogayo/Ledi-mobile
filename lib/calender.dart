import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'calender/calender_icons.dart';



class Calender extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _CalenderState();
  }

}
class _CalenderState extends State<Calender>{
  DateTime _currentDate;
  EventList<Event> _markedDatesMap=EventList<Event>(
   events:{},
 );


  Widget _bleeding (String day)=>Container(
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.all(
        Radius.circular(1200)
      )
    ),
//    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
    child:Center(
      child:Text(day,
      style: TextStyle(
        color: Colors.black
      ),),
    ),

  );

  @override
  Widget build(BuildContext context) {


     double cHeight=MediaQuery.of(context).size.height;
    return Scaffold(
        appBar:AppBar(title:Text("Calender"),
        actions:<Widget>[
            FlatButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalenderIcons()));},
            icon: Icon(Icons.info,
            color:Color(0xffE7CFFF),
            ),
                label: Text(""))
        ]
        ),
        body:Container(
          child:CalendarCarousel<Event>(
            onDayPressed: (DateTime date,List<Event> events) {
              this.setState(() => _currentDate = date);
              _markedDatesMap.add(date, Event(
                date:date,
                title:"Bled",
                icon:_bleeding(date.day.toString())
              ));
            },
            iconColor:Color(0xff4d004d) ,
            headerTextStyle: TextStyle(color:Color(0xff4d004d), fontSize: 18, fontWeight:FontWeight.bold ),
            height:cHeight*0.8,
           todayButtonColor: Colors.blue,
            weekendTextStyle: TextStyle(color: Colors.purpleAccent),
            markedDatesMap: _markedDatesMap,
            markedDateShowIcon: true,
            markedDateIconMaxShown: 1,
            markedDateMoreShowTotal: null,
            markedDateIconBuilder: (event){
             return event.icon;
            },


          ),

    ));
  }

}
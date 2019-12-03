import 'package:flutter/material.dart';

class CycleAnalysis extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CycleAnalysisState();
  }
}


class _CycleAnalysisState extends State<CycleAnalysis> {


  Widget _displayAverageStat(String title, String number){
    TextStyle sub_heading_style = TextStyle(fontFamily: 'Montserrat', color: Color(0xff120023),fontSize: 17);
    var tit=[];
    tit=title.split(" ");
    return Container(
      padding:EdgeInsets.fromLTRB(5.0, 7.0, 5.0, 7.0),
      width:MediaQuery.of(context).size.width / 3.6,
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
        color: Color(0xffE7CFFF),

      ),
      child: Column(
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
            Text(tit[0], style:sub_heading_style,softWrap: true,),
            Text(tit[1], style:sub_heading_style,softWrap: true,),
            Text(number,style: TextStyle(fontSize: 28, color: Colors.deepOrange),),
            Text("days"),

          ]),
    );
  }

  Widget notTrackingSymptoms(){
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 10.0),
      leading:Icon(Icons.add_circle,color:Color(0xff4d004d), size:46),
      title:Text("You haven't been tracking any symptoms. Start tracking your symptoms now", ),
      onTap: ()=>print("tapped"),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
    TextStyle title_style = TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20.0,
        color: Color(0xff4d004d),
        fontWeight: FontWeight.bold);
    TextStyle sub_heading_style = style.copyWith(
        color: Color(0xff120023),fontSize: 17);
    TextStyle paragraph = TextStyle(
        fontFamily: 'Montserrat', fontSize: 16.0, color: Colors.black87);



    return Scaffold(
        appBar: AppBar(title: Text("Cycle Analysis")),
        body: Container(
            child: ListView(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          children: [
            Center(
              child: Text(
                "Your cycle averages",
                style: title_style,
              ),
              heightFactor: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              _displayAverageStat("Cycle Length", "20"),
                _displayAverageStat("Cycle Variation", "2.5"),
                _displayAverageStat("Period Length", "5"),
              ],
            ),
             Center(
              child: Text(
                "Your symptoms",
                style: title_style,
              ),
              heightFactor: 1.5,
            ),
        notTrackingSymptoms(),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(24.0),
          color: Color(0xff8731DC),
          child:MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed:()=>print("clicked") ,
              child: Text('Download data as a CSV',
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),),
          Center(
          child: Text(
            "Your History",
            style: title_style,
          ),)
          ],

        )
        )
    );
  }
}


//defining cycle api

class Cycle{
  DateTime start;
  DateTime end;
  int duration;
  DateTime periodStart;
  DateTime periodEnd;
  DateTime fertilityStart;
  DateTime fertilityEnd;
  Cycle({this.start, this.end, this.duration, this.periodStart, this.periodEnd, this.fertilityStart, this.fertilityEnd})

  {


}

}
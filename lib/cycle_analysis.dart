import 'package:flutter/material.dart';


class CycleAnalysis extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _CycleAnalysisState();
  }

}
class _CycleAnalysisState extends State<CycleAnalysis> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title:Text("Cycle Analysis")),
        body: Container(
      color: Colors.deepOrange,
    ));
  }
}
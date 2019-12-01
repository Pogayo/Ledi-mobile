import 'package:flutter/material.dart';
import 'licence.dart';
import 'privacy_policy.dart';
import 'about.dart';
import 'licence.dart';


class Settings extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return  ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.info,color:Color(0xff120023)),
          title: Text('About'),
            onTap:() {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()));}
        ),
        ListTile(
          leading: Icon(Icons.vpn_key,
              color:Color(0xff120023)),
          title: Text('Pivacy Policy'),
          onTap:() {
              Navigator.push(
                  context,
              MaterialPageRoute(builder: (context) => PrivacyPolicy()));}
           ),

        ListTile(
          leading: Icon(Icons.public,color:Color(0xff120023)),
          title: Text('Licence'),
            onTap:() {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => License()));}
        ),

        ListTile(
          leading: Icon(Icons.share,
          color:Color(0xff120023)),
          title: Text('Share Ledi'),
        ),
      ],
    );
  }
}
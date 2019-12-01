import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';


class Licence extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    final  licence_body_text=RichText(
        text:TextSpan(
            children:<TextSpan>[
              TextSpan(
                style: DefaultTextStyle.of(context).style,
                  text:"Ledi is an open source menstrual cycle tracking app."
              ),
              TextSpan(
                style: DefaultTextStyle.of(context).style,
                  text:"This application is distributed with the hope that it will help women manage their reproductive health.\n"
                  "I DO NOT guarantee that it is fit for a particular purpose or that it will be accurate or produce certain results. \n"
                  "Ledi is distributed under GNU general public licence."
              ),
              TextSpan(
                text: " Visit their website for more details",
                style: new TextStyle(color: Colors.blue),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () { launch("https://www.gnu.org/licenses/gpl-3.0.en.html");
                  },
              ),
              TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  text:"You can contact me via."
              ),
              TextSpan(
                text: "email",
                style: new TextStyle(color: Colors.blue),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () { launch("mailto:pogayo17@alustudent.com?subject=Ledi&App=Hello,");
                  },
              ),
              TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  text:"for feedback or any concern"
              ),


            ]));

    return Scaffold(
      appBar: AppBar(
        title:Text("Licence")
      ),
      body:Container(
        child:licence_body_text
      )
    );

  }
}

//_launchURL() async {
//  const url = 'https://flutter.dev';
//  if (await canLaunch(url)) {
//    await launch(url);
//  } else {
//    throw 'Could not launch $url';
//  }
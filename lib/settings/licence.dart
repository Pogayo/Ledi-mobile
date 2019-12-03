import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';


class License extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
    TextStyle sub_heading_style = style.copyWith(color: Color(0xff120023), fontWeight: FontWeight.bold,fontSize: 17);
    TextStyle paragraph=TextStyle(fontFamily: 'Montserrat', fontSize: 16.0, color: Colors.black87);

    final  licence_body_text=RichText(
        text:TextSpan(
            children:<TextSpan>[
              TextSpan(
                style: sub_heading_style,
                  text:"Ledi is an open source menstrual cycle tracking app.\n\n"
              ),
              TextSpan(
                style: paragraph,
                  text:"This application is distributed with the hope that it will help women manage their reproductive health.\n\n"
                  "I DO NOT guarantee that it is fit for a particular purpose or that it will be accurate or produce certain results. \n"
                  "Ledi is distributed under GNU general public licence."
              ),
              TextSpan(
                text: " Visit their website for more details",
                style: paragraph.copyWith(color: Colors.blue),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () { launch("https://www.gnu.org/licenses/gpl-3.0.en.html");
                  },
              ),
              TextSpan(
                  style: paragraph.copyWith(fontStyle: FontStyle.italic),
                  text:".\n\nYou can contact me via "
              ),
              TextSpan(
                text: "email",
                style: paragraph.copyWith(color: Colors.blue),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () { launch("mailto:pogayo17@alustudent.com?subject=Ledi&App=Hello,");
                  },
              ),
              TextSpan(
                  style: paragraph.copyWith(fontStyle: FontStyle.italic),
                  text:" for feedback or any concern."
              ),


            ]));

    return Scaffold(
      appBar: AppBar(
        title:Text("Licence")
      ),
      body:ListView(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        children:<Widget>[licence_body_text]
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
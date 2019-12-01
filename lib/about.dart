import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';


class About extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
    TextStyle sub_heading_style = style.copyWith(color: Color(0xff120023), fontWeight: FontWeight.bold,fontSize: 17);
    TextStyle paragraph=TextStyle(fontFamily: 'Montserrat', fontSize: 16.0, color: Colors.black87);
    final  privacy_body_text=RichText(
        text:TextSpan(
            children:<TextSpan>[
              TextSpan(
                  style:TextStyle(fontFamily: 'Montserrat', fontSize: 18.0, color: Color(0xff120023), fontWeight: FontWeight.bold),
                  text:"About Ledi\n\n"
              ),
              TextSpan(
                  style: paragraph,
                  text:"Ledi is A menstrual management application that is available for android systems. The app helps you track your period days and your symptoms "
                      "whule ensuring the hirest level of security, privacy and accuracy.\n\n"
                      "This is an open source project, we do not charge for anything and aren't paid to develop the app.\n\n"

              ),
              TextSpan(
                text: "Credits\n\n",
                style: sub_heading_style,
              ),
              TextSpan(
                  style: paragraph,
                  text:"I am grateful to Nehemie Niyomahoro for the wonderful design and to all those who provided useful feedback.\n\n"
              ),
              TextSpan(
                text: "About developer\n\n",
                style: sub_heading_style,
              ),
              TextSpan(
                  style: paragraph,
                  text:"My name is Perez Ogayo. I am currently a third year Computer Science student at African Leadership University."
                      "I am proficient in Java, Python , Javascript, SQL, HTML & CSS. I have decent PHP, C and Dart skills. I am profiecient in"
                      "Pytorch, ReactJS and flutter framework."
                      "\n\nActively looking for Software development, Website Development, Machine Learning and Data Scientist roles. If you have any interesting positions, please share with me via "
              ),
              TextSpan(
                text: "email ",
                style: paragraph.copyWith(color:Colors.blue,),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () { launch("mailto:pogayo17@alustudent.com?subject=Ledi&App=Hello,");
                  },
              ),
              TextSpan(
                text: "\n\nBuy me some coffee\n\n",
                style: sub_heading_style,
              ),
              TextSpan(
                  style: paragraph,
                  text:"Please support me so that I can continue maintaining this application. If you want to donate, just contact me via email.\n\n"
              ),
              TextSpan(
                text: "App version\n\n",
                style: sub_heading_style,
              ),
              TextSpan(
                  style: paragraph,
                  text:"1.0.0+1\n\n"
              ),

            ]));

    return Scaffold(
        appBar: AppBar(
            title:Text("Privacy Policy")
        ),
        body:ListView(
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            children:<Widget>[privacy_body_text]
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
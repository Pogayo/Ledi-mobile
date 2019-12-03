import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';


class PrivacyPolicy extends StatelessWidget{

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
                  text:"Ledi Privacy Policy\n\n"
              ),
              TextSpan(
                  style: paragraph,
                  text:"The Ledi team recognizes the great responsibility of managing sensitive data such as your menstrual data. We are committed to ensuring that"
                      "your data is safe, and that you feel safe. We will outline what kind of data we collect and what we do with it, and what we don't collect.\n\n"

              ),

              TextSpan(
                text: " Personal data we collect\n\n",
                style: sub_heading_style,
              ),
              TextSpan(
                  style: paragraph,
                  text:"We only collect your login information; your email and password and store them on our servers.\n\n"
              ),
              TextSpan(
                text: " Personal data we do not collect\n\n",
                style: sub_heading_style,
              ),
              TextSpan(
                  style: paragraph,
                  text:"• Menstrual data\n• IP iddress\n *All your menstrual data remain on your device, they are NOT SENT to our servers\n\n"
              ),
              TextSpan(
                text: " How we use personal data that we collect\n\n",
                style: sub_heading_style,
              ),
              TextSpan(
                  style: paragraph,
                  text:"We may use your email addressesto send you surveys to improve the application. We DO NOT share your account data with anybody else.\n\n"
              ),
              TextSpan(
                text: " Firebase Analytics\n\n",
                style: sub_heading_style,
              ),
              TextSpan(
                  style: paragraph,
                  text:"We use firebase analytics, a service from google to track usage statistics of the app. No personal details in identifiebale format are collected. Google employs best industry security and privacy practices.\n\n"
              ),
              TextSpan(
                  style: paragraph,
                  text:"We hope you find this policy clear and transparent.\n "
              ),
              TextSpan(
                  style: paragraph.copyWith(fontStyle: FontStyle.italic),
                  text:"If any part of this privacy policy was unclear or you have any questions can contact us via "
              ),
              TextSpan(
                text: "email ",
                style: paragraph.copyWith(color:Colors.blue,),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () { launch("mailto:pogayo17@alustudent.com?subject=Ledi&App=Hello,");
                  },
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
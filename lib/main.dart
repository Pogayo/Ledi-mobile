import 'package:flutter/material.dart';
import 'authentication.dart';
import 'login.dart';
import 'root_page.dart';


void main() => runApp(MyApp());
BaseAuth auth=new Auth();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ledi App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cursorColor:Color(0xff8731DC),
          primaryColor: Color(0xff8731DC),
          accentColor: Color(0xffE7CFFF),
          bottomAppBarColor: Color(0xff120023),
//          buttonTheme:Color(0xff8731DC),
          accentColorBrightness: Brightness.dark
      ),
      home: new RootPage(auth: new Auth())
    );
  }
}

//show pink Color(0xffE7CFFF)


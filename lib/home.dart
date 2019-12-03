import 'package:flutter/material.dart';
import 'authentication.dart';
import 'Settings.dart';
import 'current_cycle.dart';
import 'cycle_analysis.dart';
import 'calender.dart';


class Home extends StatefulWidget {
  Home({Key key, this.title, this.auth, this.userId, this.logoutCallback}) : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  final String title;
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex=0;

  void _signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }



    @override
  Widget build(BuildContext context) {

      final List<Widget> _children =[
        CurrentCycle(),
        Calender(),
        CycleAnalysis(),
        Settings(auth:widget.auth,logoutCallback:widget.logoutCallback)
      ];

      return Scaffold(

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        backgroundColor: Color(0xffE7CFFF),
        selectedItemColor:Color(0xff120023),
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home,
            color: Color(0xff8731DC)),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.calendar_today, color: Color(0xff8731DC)),
            title: new Text('Calender'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up, color: Color(0xff8731DC)),
              title: Text('Analysis')
          )
          ,
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Color(0xff8731DC)),
              title: Text('Settings')
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

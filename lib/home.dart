import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'authentication.dart';


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
  final List<Widget> _children =[
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.brown)
  ];

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed:_signOut)
        ],

      ),
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
              icon: Icon(Icons.person, color: Color(0xff8731DC)),
              title: Text('Profile')
          )
          ,
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Color(0xff8731DC)),
              title: Text('Settings')
          )
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

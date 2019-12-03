import 'package:flutter/material.dart';
import 'settings/licence.dart';
import 'settings/privacy_policy.dart';
import 'settings/about.dart';
import 'authentication.dart';

class Settings extends StatelessWidget {
  Settings({Key key, this.auth, this.logoutCallback}) : super(key: key);
  final BaseAuth auth;
  final VoidCallback logoutCallback;

  _signOut() async {
    try {
      await auth.signOut();
      logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
//
      ),
      body: ListView(
          children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
              leading: Icon(Icons.info, color: Color(0xff120023)),
              title: Text('About'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              }),
          ListTile(
              leading: Icon(Icons.vpn_key, color: Color(0xff120023)),
              title: Text('Pivacy Policy'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              }),
          ListTile(
              leading: Icon(Icons.public, color: Color(0xff120023)),
              title: Text('Licence'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => License()));
              }),
          ListTile(
            leading: Icon(Icons.share, color: Color(0xff120023)),
            title: Text('Share Ledi'),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Color(0xff120023)),
            title: Text('Log out'),
            onTap: _signOut,
          ),
        ],
      ).toList()),
    );
  }
}

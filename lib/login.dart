import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';


Widget showLogo(){
  return new Hero(
    tag: 'hero',
    child: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 50.0,
        child: Image.asset('assets/images/ledi-logo.PNG'),
      ),
    ),
  );
}

class Login extends StatefulWidget {
  Login({Key key, this.title, this.auth, this.loginCallback}) : super(key: key);

  final String title;
  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);

  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  bool _isLoading=false;
  String _errorMessage;
  bool _isLoginForm;

  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }


  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff8731DC),)));
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
  @override
  Widget build(BuildContext context) {

    final emailField =TextFormField(
      onSaved: (value) => _email = value.trim(),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      obscureText: false,
      style: style,
      maxLines: 1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          prefixIcon: new Icon(
            Icons.mail,
            color: Color(0xff8731DC),
          ),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),

    );


    final passwordField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => _password = value.trim(),
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      obscureText: true,
      style: style,
      maxLines: 1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: new Icon(
            Icons.lock,
            color:  Color(0xff8731DC),),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(24.0))),
    );

    final showForm=Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                showLogo(),
                SizedBox(height: 35.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(height: 25.0,),
                showPrimaryButton(),
                SizedBox(height: 20.0,),
                showSecondaryButton(),
                showErrorMessage(),
              ],
            ),
          ),
        ),
      );


    return Scaffold(

      body: Stack(
        children: <Widget>[
          showForm,
          showCircularProgress(),
        ],
      )
    );
  }

  Widget showSecondaryButton() {
    return new FlatButton(
      color:Color(0xffE7CFFF),
        child: new Text(
            _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
            style:  style.copyWith(
                color: Color(0xff8731DC), fontWeight: FontWeight.bold)),
        onPressed: toggleFormMode);
  }

  Widget showPrimaryButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(24.0),
      color: Color(0xff8731DC),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed:validateAndSubmit ,
        child: Text(_isLoginForm ? 'Login' : 'Create account',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}


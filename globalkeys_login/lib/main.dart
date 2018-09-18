import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login with GlobalKeys',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginHome(),
    );
  }
}

class LoginHome extends StatefulWidget{
  @override
  LoginHomeState createState() {
    return new LoginHomeState();
  }
}

class LoginHomeState extends State<LoginHome> {
  bool loggedIn = false;

  String _username, _password, _email;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(loggedIn);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: !loggedIn ? Center(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "email",
                ),
                validator: (str) => !str.contains('@') ? "Not a valid email" : null,
                onSaved: (str) => _email = str,
              ),
//              TextFormField(
//                decoration: InputDecoration(
//                  labelText: "password"
//                ),
//                obscureText: true,
//                validator: (str) => "Not a valid password",
//                onSaved: (str) => _password = str,
//              ),
//              TextFormField(
//                decoration: InputDecoration(
//                  labelText: "username"
//                ),
//                validator: (str) => "Not a valid username",
//                onSaved: (str) => _username = str,
//              ),
              RaisedButton(
                onPressed: (){
                  onPressedForm();
                },
                child: Text("Save"),
              ),
            ],
          ),
        )
      ) : Center(child: Text("Logged in"),),
      drawer: Drawer(),
    );
  }

  void onPressedForm(){
    var form = formKey.currentState;
    print(scaffoldKey.currentState.hasDrawer);
    if(form.validate()){
      form.save();
      setState(() {
        loggedIn = true;
      });
    }

    var snackbar = SnackBar(
      content: Text("$_email"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}


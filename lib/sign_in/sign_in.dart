import 'package:flutter/material.dart';
import '../colors.dart';
import 'login.dart';
import 'register.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [cuppingBlue, cuppingBlack]),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 128.0),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Image.asset('assets/images/cupping.png'),
                ),
              ),
              SizedBox(
                height: 128.0,
              ),
              SizedBox(
                width: 300.0,
                height: 50.0,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(cuppingDarkGrey)),
                    child: Text(
                      'REGISTRATE',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              SizedBox(height: 48.0),
              SizedBox(
                width: 300.0,
                height: 50.0,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(cuppingDarkGrey)),
                    child: Text(
                      'INGRESA',
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

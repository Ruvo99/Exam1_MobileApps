import 'package:flutter/material.dart';
import 'colors.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Icon(
                    Icons.local_cafe_outlined,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'cupping',
                style: TextStyle(fontSize: 70, color: Colors.white),
              ),
              SizedBox(
                height: 64.0,
              ),
              SizedBox(
                width: 300.0,
                child:  TextButton(
                onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(cuppingDarkGrey)
                  ), 
                child: Text('REGISTRATE', style: TextStyle(color: Colors.black),
                )
              ),
              ),
              SizedBox(
                width: 300.0,
                child:  TextButton(
                onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(cuppingDarkGrey)
                  ), 
                child: Text('INGRESA', style: TextStyle(color: Colors.black),
                )
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

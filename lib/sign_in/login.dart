import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/sign_in/register.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePswd = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [cuppingBlue, cuppingBlack],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 72.0,
                ),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Image.asset('assets/images/cupping.png'),
                ),
                SizedBox(height: 80.0),
                Row(
                  children: [
                    Text(
                      'Nombre completo:',
                      style: TextStyle(color: cuppingWhite),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: cuppingWhite,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  children: [
                    Text(
                      'Password:',
                      style: TextStyle(color: cuppingWhite),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                TextField(
                  // keyboardType: TextInputType.text,
                  obscureText: hidePswd,
                  style: TextStyle(color: cuppingWhite),
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      icon: (hidePswd
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color: cuppingGrey,
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              color: cuppingGrey,
                            )),
                      onPressed: () {
                        print(hidePswd);
                        setState(() {
                          hidePswd = !hidePswd;
                        });
                        print(hidePswd);
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: cuppingGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: cuppingGrey),
                    ),
                  ),
                ),
                SizedBox(height: 48.0),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.0,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: cuppingGrey,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Home(title: APP_TITLE),
                              ),
                            );
                          },
                          child: Text(
                            "ENTRAR",
                            style: TextStyle(color: cuppingBlack),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 48.0),
                Text(
                  'Olvidaste tu password?',
                  style: TextStyle(color: cuppingGrey),
                ),
                SizedBox(height: 80.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: '¿No tienes cuenta?',
                          style: TextStyle(color: cuppingWhite)),
                      TextSpan(
                          text: '\n REGISTRATE',
                          style: TextStyle(
                              color: cuppingWhite,
                              decoration: TextDecoration.underline))
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

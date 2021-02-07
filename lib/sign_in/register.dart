import 'package:estructura_practica_1/sign_in/login.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool hidePswd = true;
  bool acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [cuppingBlue, cuppingBlack]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 72.0,
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Icon(
                    Icons.local_cafe_outlined,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'cupping',
                  style: TextStyle(fontSize: 55, color: Colors.white),
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
                      'Email:',
                      style: TextStyle(color: cuppingWhite),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                TextField(
                  keyboardType: TextInputType.emailAddress,
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
                          borderSide: BorderSide(color: cuppingGrey)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: cuppingGrey))),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    SizedBox(
                      height: 48.0,
                      width: 24.0,
                      child: Checkbox(
                          value: acceptTerms,
                          checkColor: cuppingGrey,
                          fillColor:
                              MaterialStateProperty.all<Color>(cuppingGrey),
                          activeColor: cuppingGrey,
                          onChanged: (checked) {
                            setState(() {
                              acceptTerms = checked;
                            });
                            print(acceptTerms);
                          }),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      "ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO",
                      style: TextStyle(
                        color: cuppingWhite,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Register()));
                            },
                            child: Text(
                              "REGISTRATE",
                              style: TextStyle(color: cuppingBlack),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: '¿Ya tienes cuenta?',
                          style: TextStyle(color: cuppingWhite)),
                      TextSpan(
                          text: '\n INGRESA',
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

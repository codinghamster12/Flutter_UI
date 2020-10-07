import 'package:flutter/material.dart';
import 'package:login_ui/UI/inputField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.blue,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  heightFactor: 0.6,
                  widthFactor: 0.6,
                                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(200)),
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                    child: Container(width: 400,
                  height:400,

                  ),),
                ),
                Center(
                  child: Container(
                    width: 400,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('images/flutter-logo.png',
                                width: 100, height: 100),
                          ),
                        ),
                        InputField(
                            fieldIcon: Icon(Icons.person, color: Colors.white),
                            hintText: 'Username'),
                        InputField(
                            fieldIcon: Icon(Icons.lock, color: Colors.white),
                            hintText: 'Password'),
                        Container(
                            width: 150,
                            child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                color: Colors.deepOrange,
                                child: Text('Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    )))),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}

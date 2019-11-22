import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/services/network.service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  void loginPressed(context) async{
    var loginInfo = {"phoneNumber": _phoneNumberController.text,
      "password": _passwordController.text};
    var loginJSON = jsonEncode(loginInfo);
    _phoneNumberController.clear();
    _passwordController.clear();
    var success = await request("/user/login", RequestCode.FETCH_LOGIN,
        loginInfo: loginJSON);
    if(success) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          decoration: BoxDecoration(color: const Color((0xFFF7E7CE))),
          child: Padding(
              padding: EdgeInsets.fromLTRB(50, 150, 50, 100),
              child: Column(
                children: <Widget>[
                  new Text('Stumble',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lobster',
                      )),
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
                    child: new TextField(
                      controller: _phoneNumberController,
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                      cursorWidth: 2,
                      enableInteractiveSelection: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Phone Number'
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 80),
                    child: new TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password'
                      ),
                    ),
                  ),
                  new RaisedButton(
                      onPressed: () => loginPressed(context),
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                          decoration: const BoxDecoration(
                            color: const Color((0xFFFEBB6A)),
                          ),
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          child: Text('Log In',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lobster',
                              ))))
                ],
              ))),
    );
  }
}

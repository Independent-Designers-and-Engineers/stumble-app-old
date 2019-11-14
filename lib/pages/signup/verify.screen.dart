import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  class Verify extends StatelessWidget {

    final TextEditingController codetext= TextEditingController();

  @override
  Widget build(BuildContext ctxt) {
  return new Scaffold(
      body: Column(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 100
            ),
              TextField(
                obscureText: false,
                controller: codetext,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Code',
                ),
              ),
              RaisedButton(
                child: Text("Verify Phone Number"),
                onPressed: () {
                  print(codetext.toString());
                  Map data =new Map<String,dynamic>();
                } ,),
              RaisedButton(child: Text("Resend Number"),)

        ])
  );
  }
  }



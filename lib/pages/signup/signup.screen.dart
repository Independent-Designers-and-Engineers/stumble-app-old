import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/services/network.service.dart';

final firstNameNode = FocusNode();
final lastNameNode = FocusNode();
final phoneNode = FocusNode();
final passwordNode = FocusNode();
final buttonNode = FocusNode();
final _fnameController = TextEditingController();
final _lnameController = TextEditingController();
final _phoneController = TextEditingController();
final _passwordController = TextEditingController();

var inputs = {
  "fname": "N/A",
  "lname": "N/A",
  "phone": "N/A",
  "pass": "N/A"
};

class PhoneInputFormatter extends TextInputFormatter{ //TODO:
  TextEditingValue formatEditUpdate(TextEditingValue oldv, TextEditingValue newv){
  }
}

Widget phoneWidget(context){
  return Center(
      child: Container(
          padding: const EdgeInsets.all(8),
          height: 60,
          child: TextField(
            focusNode: phoneNode,
            textInputAction: TextInputAction.next,

            controller: _phoneController,
            keyboardType: TextInputType.number,
            enableInteractiveSelection: false,
            onSubmitted: (v){
              FocusScope.of(context).requestFocus(passwordNode);
            },
            inputFormatters:[
              LengthLimitingTextInputFormatter(10),
            ],
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone',
              //counter: SizedBox.shrink()
            ),
          )
      )
  );
}

Widget fnameWidget(context){
  return Center(
      child: Container(
          padding: const EdgeInsets.all(8),
          height: 60,
          child: TextField(
            focusNode: firstNameNode,
            textInputAction: TextInputAction.next,
            autofocus:true,

            controller: _fnameController,
            keyboardType: TextInputType.text,
            enableInteractiveSelection: true,
            obscureText: false,
            onSubmitted: (v){
              FocusScope.of(context).requestFocus(lastNameNode);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'First Name',
            ),
          )
      )
  );}

  Widget lnameWidget(context){
  return Center(
      child: Container(
          padding: const EdgeInsets.all(8),
          height: 60,
          child: TextField(
            focusNode: lastNameNode,
            textInputAction: TextInputAction.next,
            controller: _lnameController,
            keyboardType: TextInputType.text,
            enableInteractiveSelection: false,
            obscureText: false,
            onSubmitted: (v){
              FocusScope.of(context).requestFocus(phoneNode);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Last Name',
            ),
          )
      )
  );
}

Widget passwordWidget(context){
  return Center(
      child: Container(
          padding: const EdgeInsets.all(8),
          height: 60,
          child: TextField(
            focusNode: passwordNode,
            textInputAction: TextInputAction.next,
            controller: _passwordController,
            keyboardType: TextInputType.text,
            enableInteractiveSelection: true,
            obscureText: true,
            onSubmitted: (v){
              FocusScope.of(context).requestFocus(buttonNode);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          )
      )
  );
}

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen>{

  void createAccountPressed(context) async{
    var createAccountInfo = {"phoneNumber": _phoneController.text,
      "password": _passwordController.text, "firstName": _fnameController.text,
      "lastName": _lnameController.text
    };
    var accountJSON = jsonEncode(createAccountInfo);
    _fnameController.clear();
    _lnameController.clear();
    _phoneController.clear();
    _passwordController.clear();
    Profile profile = await request('/user/create', RequestCode.FETCH_CREATE,
      accountInfo: accountJSON);
    if(profile != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/home', (Route<dynamic> route) => false);
    }
  }

  void initState(){
    _fnameController.addListener(() {
      final text = _fnameController.text;
      inputs["fname"] = text;
    });

    _lnameController.addListener((){
      final text = _lnameController.text;
      inputs["lname"] = text;
    });

    _phoneController.addListener((){
      final text = _lnameController.text;
      inputs["phone"] = text;
    });

    _passwordController.addListener((){
      final text = _passwordController.text;
      inputs["pass"] = text;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow[100],
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 120, 10, 50),
          child: Column(children: <Widget>[
            fnameWidget(context),
            lnameWidget(context),
            phoneWidget(context),
            passwordWidget(context),
            RaisedButton(
              focusNode: buttonNode,
              textColor:  Colors.white,
              color: Colors.orangeAccent,
              child: Text("Create"),
              onPressed: () => createAccountPressed(context),
            )],
          ),
        )
    );
  }
}

/*
class SignupScreen extends StatelessWidget {

  static TextEditingController phoneController = TextEditingController();


  final Widget phoneWidget = Center(
    child: Container(
      padding: const EdgeInsets.all(8),
      height: 60,
      child: TextField(
        //controller: phoneController,
        keyboardType: TextInputType.number,
        enableInteractiveSelection: false,
        maxLength: 10,
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Phone',
        ),
      )
    )
  );

  final Widget fnameWidget = Center(
      child: Container(
          padding: const EdgeInsets.all(8),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.text,
            enableInteractiveSelection: true,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'First Name',
            ),
          )
      )
  );

  final Widget lnameWidget = Center(
      child: Container(
          padding: const EdgeInsets.all(8),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.text,
            enableInteractiveSelection: false,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Last Name',
            ),
          )
      )
  );

  final Widget passwordWidget = Center(
      child: Container(
          padding: const EdgeInsets.all(8),
          height: 60,
          child: TextField(
            //controller: phoneController,
            keyboardType: TextInputType.text,
            enableInteractiveSelection: true,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          )
      )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 120, 10, 10),
          child: Column(children: <Widget>[
            fnameWidget, lnameWidget, phoneWidget, passwordWidget,
            /*RaisedButton(
              color: Colors.pinkAccent,
              child: Text("Create"),
              onPressed: phoneController,
            ) */
          ],
          ),
        )
    );
  }
}

 */

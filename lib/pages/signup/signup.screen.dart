import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/match/match.screen.dart';
import 'package:frontend/pages/match/match.route.dart';
import 'package:frontend/services/api.service.dart';
import 'package:frontend/common/classes/PhoneInputFormatter.dart' as phoneFormatter;

final firstNameNode = FocusNode();
final lastNameNode = FocusNode();
final phoneNode = FocusNode();
final passwordNode = FocusNode();
final buttonNode = FocusNode();
final _fnameController = TextEditingController();
final _lnameController = TextEditingController();
final _phoneController = TextEditingController();
final _passwordController = TextEditingController();

final creme = Color(0xFFF7E7CE);
final peach = Color(0xFFD13394);
final tang = Color(0xFFFFA74F);

APIService API = new APIService();

var inputs = {
  "fname": "N/A",
  "lname": "N/A",
  "phone": "N/A",
  "pass": "N/A"
};



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
            inputFormatters:<TextInputFormatter>[
              LengthLimitingTextInputFormatter(14),
              WhitelistingTextInputFormatter.digitsOnly,
              phoneFormatter.NumberInputFormatter()
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
      final text = _phoneController.text.replaceAll(RegExp('[^\\d]'), '');
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
      backgroundColor: creme,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 120, 10, 50),
          child: Column(children: <Widget>[
            fnameWidget(context), lnameWidget(context), phoneWidget(context), passwordWidget(context),
              RaisedButton(
                focusNode: buttonNode,
                textColor: peach,
                color: tang,
                child: Text("Create"),
                onPressed: () async {
                  Map<String,dynamic> signInMap = {
                    "password": inputs["pass"],
                    "phoneNumber": inputs["phone"],
                    "firstName": inputs["fname"],
                    "lastName": inputs["lname"],
                  };
                   await API.createAccount(signInMap);

                  Map<String,dynamic> loginMap = {
                    "phoneNumber": inputs["phone"],
                    "password": inputs["pass"]
                  };
                  dynamic loginResult = await API.login(loginMap);
                  print(loginResult);

                  if (loginResult != LOGIN_STATUS.MISSING_INFO){
                    Navigator.pushReplacementNamed(context, '/message-list');
                  }
                },
              ),
              RaisedButton(
                focusNode: buttonNode,
                textColor:  Colors.white,
                color: Colors.orangeAccent,
                child: Text("temp"),
                onPressed: () {
                    print(inputs);
                },
            )
            ],
          ),
        )
    );
  }
}

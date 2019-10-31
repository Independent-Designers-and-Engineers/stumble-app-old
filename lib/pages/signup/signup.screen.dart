import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/match/match.screen.dart';
import 'package:frontend/pages/match/match.route.dart';

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

class PhoneInputFormatter extends TextInputFormatter{ //TODO: implement phone formatter
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

            //controller: phoneController,
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
            //controller: phoneController,
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
            fnameWidget(context), lnameWidget(context), phoneWidget(context), passwordWidget(context),
              RaisedButton(
                focusNode: buttonNode,
                textColor:  Colors.white,
                color: Colors.orangeAccent,
                child: Text("Create"),
                onPressed: () {

                },
              ),
              RaisedButton(
                focusNode: buttonNode,
                textColor:  Colors.white,
                color: Colors.orangeAccent,
                child: Text("temp"),
                onPressed: () {
                    Navigator.of(context).push(
                        TransparentRoute(builder: (BuildContext context) => MatchPopup())
                    );
                },
            )
            ],
          ),
        )
    );
  }
}

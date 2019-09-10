import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({Key key}) : super(key: key);

  final TextEditingController controller = new TextEditingController();

  getValue()
  {
    String value = controller.toString();
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build  @William, @Jad
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Text("data"),
          new Text("slkdjlsd"),
          new TextFormField(initialValue: "Enter phone", controller: controller,)

        ],
      ),
    );
  }
}
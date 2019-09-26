import 'package:frontend/variables.dart' as env;
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class StartScreen extends StatelessWidget {

  final Text head = new Text(
    'Welcome to ' +  env.APP_NAME,
    style: new TextStyle(
      color: Colors.white,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: this.key,
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
           // The title at the top of the start page
           this.head,
           // An image or icon or animation
           // Idk yet
           // TODO: Implement icon/animation here @Jah
           new Container(
             width: 10,
             height: 20
           ),

           Column(
             children: <Widget>[
               new RaisedButton(
                 color: Colors.deepOrangeAccent,
                 splashColor: Colors.deepOrange,
                 onPressed: () => Navigator.pushNamed(context, '/create-account'),
                 child: new Text('Create Account', style: new TextStyle(color: Colors.white)),
               ),
               new RichText(
                 text: new TextSpan(
                   children: [
                     new TextSpan(
                       text: 'or '
                     ),
                     new TextSpan (
                       text: 'login',
                       style: new TextStyle(color: Colors.blue),
                       recognizer: new TapGestureRecognizer()
                         ..onTap = () => Navigator.pushNamed(context, '/login')
                     ),
                     new TextSpan(
                      text: ' with an existing account.'
                     )
                   ]
                 ),
               ),
             ],
           ),
         ],
        ),
      )
    );
  }
}
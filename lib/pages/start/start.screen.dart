import 'package:frontend/pages/home/home.screen.dart';
import 'package:frontend/pages/pages.dart';
import 'package:frontend/pages/start/animations.dart';
import 'package:frontend/services/network.service.dart';
import 'package:frontend/services/requests.dart';
import 'package:frontend/variables.dart' as env;
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Startup extends StatefulWidget {
  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  String route = "/start-screen";

  @override
  initState(){
    super.initState();
    getRoute();
  }

  getRoute() async{
    String token = await readToken();
    Profile profile = await request("/user/current", RequestCode.FETCH_PROFILE,
        token:token);
    if(profile != null){
      route = "/home";
    }
  }

  @override
  Widget build(BuildContext context) {
    return routePages[route](context);
  }
}


class StartScreen extends StatelessWidget {

  final Text head = Text(
    'Welcome to ' +  env.APP_NAME,
    style: TextStyle(
      color: Colors.white,
      fontSize: 24,
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: AnimatedBackground()),
        Material(
          key: this.key,
          type: MaterialType.transparency,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
               // The title at the top of the start page
               Center(child: this.head),
               // An image or icon or animation
               // Idk yet
               // TODO: Implement icon here @Jah
               Container(
                 width: 10,
                 height: 20
               ),

               Column(
                 children: <Widget>[
                   RaisedButton(
                     color: Colors.deepOrangeAccent,
                     splashColor: Colors.deepOrange,
                     onPressed: () => Navigator.pushNamed(context, '/create-account'),
                     child: Text('Create Account', style: TextStyle(color: Colors.white)),
                   ),
                   RichText(
                     text: TextSpan(
                       children: [
                         TextSpan(
                           text: 'or '
                         ),
                         TextSpan (
                           text: 'login',
                           style: TextStyle(color: Colors.blue),
                           recognizer: TapGestureRecognizer()
                             ..onTap = () => Navigator.pushNamed(context, '/login')
                         ),
                         TextSpan(
                          text: ' with an existing account.'
                         )
                     ]),
                   ),
                 ],
               ),
             ],
            ),
          )
        ),
      ],
    );
  }
}
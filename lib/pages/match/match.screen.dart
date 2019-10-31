import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

class MatchPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Fired");
    return Material(
        type: MaterialType.transparency,
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Positioned.fill(
            child: BackdropFilter(
              filter: prefix0.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.black12.withOpacity(.8))),
        ),
          Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0) //spacing for top
                        )),
                Container(
                  color: Colors.transparent,
                    child: Center(
                        child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("You've \n Stumbled!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Milkshake",
                      )),
                ))),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //TODO: Replace Image.asset with AssetImage (better scaling)
                    Image.asset("assets/icons/Stumble_orange_tag.png",
                        width: 100, height: 100),
                    Container(
                        child: Padding(padding: const EdgeInsets.all(64.0))),
                    Image.asset("assets/icons/Stumble_purple_tag.png",
                        width: 100, height: 100),
                  ],
                ))
              ],
            ),
          )
        ]));
  }
}

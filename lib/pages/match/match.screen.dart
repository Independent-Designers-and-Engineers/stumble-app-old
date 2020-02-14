import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';


class MatchScreen extends StatelessWidget {

  final List<String> interests = [
    "Movie - Brainiacs",
    "Food - Lasagna",
    "Sport - Soccer"
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
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
                              padding: const EdgeInsets.fromLTRB(16, 50, 16, 25),
                              child: Text("You've\nStumbled!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Milkshake",
                                  )),
                            ))),
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //TODO: Replace Image.asset with AssetImage (better scaling)
                              Image.asset("assets/icons/Stumble_orange_tag.png",
                                  width: 100, height: 100),
                              Container(
                                  child: Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(85, 0, 85, 5))),
                              Image.asset("assets/icons/Stumble_purple_tag.png",
                                  width: 100, height: 100),
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(90, 5, 90, 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Colors.white60]),
                        ),
                        height: (interests.length * 55 + 5).toDouble(),
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8),
                          itemCount: interests.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 40,
                              child: Center(
                                  child: Text(interests[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Lobster',
                                      ))),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 45, 150, 5),
                      child: RaisedButton(
                          onPressed: () {},

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          child: Text('Accept',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lobster',
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(160, 5, 160, 10),
                      child: RaisedButton(
                          onPressed: () {},
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('Ignore',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Lobster',
                              ))),
                    )
                  ],
                ),
              )
            ])
    );
  }
}


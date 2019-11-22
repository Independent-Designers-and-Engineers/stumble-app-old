import 'package:flutter/material.dart';
import 'package:frontend/pages/pages.dart';

class DevBarScreen extends StatelessWidget {

  String dropdown = routePages.keys.first;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),

          DropdownButton(
            value: dropdown,
            icon: Icon(Icons.arrow_downward),
            items: routePages.keys
              .map<DropdownMenuItem<String>>((String val) =>
                DropdownMenuItem<String>(
                  value: val,
                  child: Text(val))
            ).toList(),
            style: TextStyle(
                color: Colors.deepPurple
            ),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              Navigator.pushNamed(context, newValue);
            },
          )
        ],
      )
    );
  }
}

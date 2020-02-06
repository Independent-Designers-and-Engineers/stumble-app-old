import 'package:flutter/material.dart';
import 'package:frontend/services/api.service.dart';

class LoginScreen extends StatelessWidget {
  final creme = Color(0xFFF7E7CE);
  final peach = Color(0xFFD13394);
  final tang = Color(0xFFFFA74F);
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          decoration: BoxDecoration(color: const Color((0xFFF7E7CE))),
          child: Padding(
              padding: EdgeInsets.fromLTRB(50, 150, 50, 100),
              child: Column(
                children: <Widget>[
                  new Text('Stumble',
                      style: TextStyle(
                        fontSize: 50,
                        color: peach,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lobster',
                      )),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
                    child: new TextField(
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                      cursorWidth: 2,
                      enableInteractiveSelection: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Phone Number'
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 80),
                    child: new TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password'
                      ),
                    ),
                  ),
                  new RaisedButton(
                      onPressed: () async {
                        Map<String, dynamic> body = {'phoneNumber': '4804804801', 'password': '1mypassword'};
                        APIService apiService = new APIService();
                        print('========================\n\n\n');
                        LOGIN_STATUS ll = await apiService.login(body);
                        print(ll);
                        print(APIService.HEADERS['authorization']);
                        print('\n\n\n========================');
                      },
                      textColor: peach,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      color: tang,
                          child: Text('Log In',
                              style: TextStyle(
                                fontSize: 20,
                                color: peach,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lobster',
                              )))
                ],
              ))),
    );
  }
}

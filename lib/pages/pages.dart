import 'package:flutter/material.dart';
import 'package:frontend/pages/contacts/contact-list.screen.dart';
import 'package:frontend/pages/devbar/devbar.screen.dart';
import 'package:frontend/pages/login/login.screen.dart';
import 'package:frontend/pages/match/match.screen.dart';
import 'package:frontend/pages/signup/signup.screen.dart';

Map<String, Widget Function(BuildContext)> routePages = {
  '/': (BuildContext context) => DevBarScreen(),
  '/create-account': (BuildContext context) => SignupScreen(),
  '/login': (BuildContext context) => LoginScreen(),
  '/message-list': (BuildContext context) => MessageList(),
  '/match': (BuildContext context) => MatchScreen(),
};
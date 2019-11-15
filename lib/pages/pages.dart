import 'package:flutter/material.dart';
import 'package:frontend/pages/signup/signup.screen.dart';
import 'package:frontend/pages/start/start.screen.dart';
import 'package:frontend/pages/login/login.screen.dart';
import 'package:frontend/pages/home/home.screen.dart';
import 'package:frontend/pages/message thread/message.list.dart';

Map<String, Widget Function(BuildContext)> routePages = {
  '/': (BuildContext context) => StartScreen(),
  '/message-list': (BuildContext context) => MessageList(),
  '/create-account': (BuildContext context) => SignupScreen(),
  '/login': (BuildContext context) => LogIn(),
  '/home': (BuildContext context) => HomeScreen(),
};
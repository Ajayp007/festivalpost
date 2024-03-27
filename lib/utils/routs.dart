import 'package:festivalpost/screens/edit/edit_screen.dart';
import 'package:festivalpost/screens/home/home_screen.dart';
import 'package:festivalpost/screens/splash/splash_screen.dart';
import 'package:festivalpost/screens/user/user_screen.dart';
import 'package:flutter/material.dart';


Map<String,WidgetBuilder> myrouts = {
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'user':(context) => const UserScreen(),
  'edit':(context) => const EditScreen(),
};
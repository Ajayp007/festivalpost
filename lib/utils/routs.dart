import 'package:festivalpost/screens/edit/edit_screen.dart';
import 'package:festivalpost/screens/home/home_screen.dart';
import 'package:festivalpost/screens/imageview/imageview_screen.dart';
import 'package:festivalpost/screens/user/user_screen.dart';
import 'package:flutter/material.dart';


Map<String,WidgetBuilder> myrouts = {
  '/':(context) => const HomeScreen(),
  'view':(context) => const ImageViewScreen(),
  'user':(context) => const UserScreen(),
  'edit':(context) => const EditScreen(),
};
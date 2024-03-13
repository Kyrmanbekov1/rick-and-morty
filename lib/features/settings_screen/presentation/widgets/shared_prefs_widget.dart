import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsWidget extends StatelessWidget {
   SharedPrefsWidget({super.key, required this.child}){     
    initPrefs();
  }
  
  

  final Widget child;
  static late SharedPreferences prefs;

  initPrefs() async{
    prefs = await SharedPreferences.getInstance();
    print('object');
  }
  @override
  Widget build(BuildContext context) {
    return child;
}
}
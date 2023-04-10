import 'package:demo/screens/Homepagege.dart';
import 'package:demo/screens/splash.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        'splash' : (context) => const Splash(),
        '/' : (context) => const HomePage(),
      },
    ),
  );
}
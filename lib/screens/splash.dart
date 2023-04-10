import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  State<Splash> createState() => Splash_State();
}

class Splash_State extends State<Splash> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Distance Convertor App",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Crimson',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset("assets/images/download.png"),
            ],
          ),
        ),
      ),
    );
  }
}
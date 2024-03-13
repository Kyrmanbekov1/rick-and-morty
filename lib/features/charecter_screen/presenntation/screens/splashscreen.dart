import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/screens/home_screen.dart';
import 'package:rick_and_morty/resources/resources.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
@override
  void initState() {
routing();
    super.initState();
  }

Future <void> routing() async{
  await Future.delayed(Duration(seconds:  2));
   Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppPngs.backgroundsplash,
          
          ),
          fit: BoxFit.fill)),
        )
        


  );
  }
}
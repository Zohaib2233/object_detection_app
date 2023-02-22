import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'home_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(logo: Image.asset('images/back.jpg'),
    durationInSeconds: 3,
    backgroundImage: Image.asset('images/back.jpg').image,
    loaderColor: Colors.red,
    navigator: HomePage(),);
  }
}

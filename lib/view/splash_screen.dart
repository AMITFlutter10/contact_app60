import 'dart:async';

import 'package:contact_app60/view/login_screen.dart';
import 'package:contact_app60/view/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:sizer/sizer.dart';

import '../router/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> { 
   @override
  void initState() {
      Timer(const Duration(seconds: 5),
          (){
             Navigator.pushNamedAndRemoveUntil(context, AppRoute.onBoardingScreen,
                     (route) => false);
          }
      );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.network(
            'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
        SizedBox(
          height: 2.h,
        ),
        DefaultText(
          text: "Welcome Contact app",
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      ],
    ),
    //   body:  EasySplashScreen(
    //       logo: Image.network(
    //           'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
    //       title: const Text(
    //         "Welcome Contact app",
    //         style: TextStyle(
    //           fontSize: 18,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       backgroundColor: Colors.grey.shade400,
    //       showLoader: true,
    //       navigator: LoginScreen(),
    //       durationInSeconds: 5,
    //     ),
        );
  }
}

import 'package:contact_app60/view/widgets/default_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../model/onboarding_model.dart';
import 'builder_onboarding.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});
var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        actions: [
         TextButton(onPressed: (){
           // Login
           //tzhr awl screen bs
         }, child: DefaultText(text: "Skip",
           fontSize: 10.sp,))
      ],),
      body: Column(
        children: [
          PageView.builder(
            controller: pageController,
             itemBuilder: (context , index){
                return BuilderOnBoarding(onBoardingModel: dataOnBoarding[index],);
               },
            itemCount:  dataOnBoarding.length,
             onPageChanged: (onChange){},

              ),
          SizedBox(height: 1.h,),
          ElevatedButton(onPressed: (){
            // yzhr f a5er screen bs bnsba l pageView
          }, child: DefaultText(text: "Next", fontSize: 12.sp,))
        ],
      ));
  }
}

//باستخدام الشرد ازاى اقولو اني شوفت كل ال onboarding  ف متظهرهاش ليا تاني
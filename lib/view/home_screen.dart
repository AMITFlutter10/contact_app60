import 'package:contact_app60/view/widgets/default_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: DefaultText(text: "Home Screen"),),
    );
  }
}

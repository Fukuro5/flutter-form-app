import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(ClarioFormFlutter());
}

class ClarioFormFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clario Form Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpForm(),
    );
  }
}

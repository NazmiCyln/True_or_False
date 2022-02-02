import 'package:flutter/material.dart';
import 'package:true_or_false/soru_ekran.dart';

void main() {
  runApp(Test());
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoruSayfasi(),
    );
  }
}

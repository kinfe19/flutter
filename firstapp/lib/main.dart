import 'package:flutter/material.dart';
import './r_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final wordpair = WordPair.random(); 
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 9, 36, 44)),
      home: RandomWords(),
      debugShowCheckedModeBanner: false, 
    );
  }
}

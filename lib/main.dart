import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home:Scaffold(
        appBar: new AppBar(
          title: const Text('Welcome to Flutter')
        ),
     body: new Center(
       child: new Text(wordPair.asPascalCase),
     ),
      ),
    );
    
    }
}
    
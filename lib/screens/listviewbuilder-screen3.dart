import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Screenthree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Listviewbuilder(),
    ));
  }
}

class Listviewbuilder extends StatefulWidget {
  @override
  listviewbuilderpage createState() => listviewbuilderpage();
}

class listviewbuilderpage extends State<Listviewbuilder> {
  final suggestion = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(15.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i;

          if (index >= suggestion.length) {
            suggestion.addAll(generateWordPairs().take(10));
          }
          return ListTile(
            title: Text(
              suggestion[index].asPascalCase,
            ),
          );
        });
  }
}

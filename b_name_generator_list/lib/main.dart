import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Welcome to flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Name generator'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
    // throw UnimplementedError();
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final _suggestion = <WordPair>[];
    const _biggerFont = TextStyle(fontSize: 18.0);
    final wordPair = WordPair.random();
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();
            final index = i ~/ 2;
            if (index >= _suggestion.length) {
              _suggestion.addAll(generateWordPairs().take(10));
            }
            return ListTile(
              title: Text(
                _suggestion[index].asPascalCase,
                style: _biggerFont,
              ),
            );
          }),
    );
  }
}

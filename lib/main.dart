import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp()); /*1*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool _isTutorial = true;

  @override
  Widget build(BuildContext context) {
    if (!_isTutorial) {
      return const MaterialApp(title: 'Welcome to Flutter', home: RandomWords());
    } else {
      return MaterialApp(
        title: 'Flutter Material Design',
        home: Scaffold(
          body: Center(
            child: Container(
              color: Colors.blue,
              width: 300.0,
              height: 300.0,
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(0.1),
              child: const Text('word'),
            ),
          ),
        ),
      );
    }
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider();
          /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]); /*5*/
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  RandomWordsState createState() => RandomWordsState();
}

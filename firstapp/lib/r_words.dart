import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override

  final _randomWordPairs = <WordPair>[];
  final _saveWordPairs = Set<WordPair>(); 

  Widget _buildList(){
    
    return ListView.builder(
      padding: const EdgeInsets.all(26.0),
      itemBuilder: (context, item) {
        if(item.isOdd) return Divider();

        final index = item ~/ 2;
        if(index >= _randomWordPairs.length){
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randomWordPairs[index]);
      },
 
);
  }
  Widget _buildRow(WordPair pair) {
    final saved = _saveWordPairs.contains(pair);
    return ListTile(title: Text(pair.asSnakeCase,style: TextStyle(fontSize: 27.0)),
    
    trailing: Icon(saved ? Icons.favorite :
    Icons.favorite_border,
    color: saved ? Colors.red : null),

    onTap: () {
      setState(() {
        if(saved){
          _saveWordPairs.remove(pair);
        }
        else{
          _saveWordPairs.add(pair);
        }
      });
    },
    
   );
  }
 
  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saveWordPairs.map((WordPair pair) {
        return ListTile(
            title: Text(pair.asPascalCase, style: TextStyle(fontSize: 26.0)));
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(title: Text('Saved WordPairs')),
          body: ListView(children: divided));
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wordpair Genenator", style: TextStyle(fontSize: 30.0)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved


          ),
        ]
      ),
      body: _buildList(),
    );
  }
}

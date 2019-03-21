import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Startup Name Generator',
      home:new RandomWords(),
    
     
    );
    
    }
}

class RandomWordsState extends State<RandomWords> {

@override
Widget build(BuildContext context){
 // final wordPair = new WordPair.random();
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0,fontFamily: "Hind");
  final Set<WordPair> _saved = new Set<WordPair>();
Widget _buildRow(WordPair pair) {                    // function 
   final bool alreadySaved =_saved.contains(pair);
  
    return new ListTile(         // simply creates a list style
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
       trailing: new Icon(
         alreadySaved ? Icons.favorite: Icons.favorite_border,
         color: alreadySaved ? Colors.red : null,
       ),

    );
  }
 Widget _buildSuggestions() {                         // function
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // The itemBuilder callback is called once per suggested 
      // word pairing, and places each suggestion into a ListTile
      // row. For even rows, the function adds a ListTile row for
      // the word pairing. For odd rows, the function adds a 
      // Divider widget to visually separate the entries. Note that
      // the divider may be difficult to see on smaller devices.
      itemBuilder: (BuildContext _context, int i) {
        // Add a one-pixel-high divider widget before each row 
        // in the ListView.
        if (i.isOdd) {
          return new Divider();
        }

        // The syntax "i ~/ 2" divides i by 2 and returns an 
        // integer result.
        // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
        // This calculates the actual number of word pairings 
        // in the ListView,minus the divider widgets.
        final int index = i ~/ 2;
        // If you've reached the end of the available word
        // pairings...
        if (index >= _suggestions.length) {
          // ...then generate 10 more and add them to the 
          // suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
 //return new Text(wordPair.asPascalCase);
return new Scaffold (                    
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );                                      
  }
}



class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => new RandomWordsState();

  // it can also written as as follows
  // @override
  // State<StatefulWidget> createState(){
  //   return RandomWordsState();
  // }
}
    
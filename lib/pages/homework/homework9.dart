import 'package:flutter/material.dart';
import 'package:hello/pages/classroom/game/game.dart';



class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // Game? _game; //อันนี้แปลว่าอนุญาติให้เป็น null ได้
  late Game _game; // เป็นการยืนยันว่าเดี๋ยวเราจะ initialize ให้มัน
  final _controller = TextEditingController();
  String? _guessNumber;
  String? _feedback;
  var count = 0;
  List<int> guessTrack = [];

  void _showMaterialDialog(String title, String msg){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('OK'))
        ],
      );
    });
  }

  @override
  void initState(){
    super.initState();
    _game = Game();
  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.yellow.shade100,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/123.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMainContent(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/123.jpg',
          width: 240.0, // 160 = 1 inch
        ),
        Text(
          'GUESS THE NUMBER',
          style: TextStyle(fontSize: 22.0),
        ),
      ],
    );
  }

  // Text _buildMainContent() => Text('TEST');
  Widget _buildMainContent() {
    return _guessNumber == null ? Text("I'm thinking of a number between 1 and 100. Can you guess it?") : Column(
      children: [
        Text(_guessNumber!),
        Text(_feedback!), _feedback == 'CORRECT' ?
        ElevatedButton(
          onPressed:(){setState(() {
            _guessNumber = null;
            _feedback = null;
            count = 0;
            _game =Game();
            guessTrack.clear();
          });},
          child: Text('NEW GAME!'),
          // style: ButtonStyle(
          //   foregroundColor:
          //       MaterialStateProperty.all<Color>(
          //           Colors.blue),
          // ),
        ): SizedBox.shrink(),
      ],
    );
  }

  Widget _buildInputPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal, width: 10.0),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            String input = _controller.text;
            setState(() {
              _guessNumber = _controller.text;
              int? guess = int.tryParse(_guessNumber!);

              if (guess != null){
                guessTrack.add(guess);
                count+=1;
                int result = _game.doGuess(guess);if (result == 0){
                  _feedback = 'CORRECT';
                  _controller.clear();
                  String track;
                  _showMaterialDialog('GOOD JOB', 'The answer is $_guessNumber. You have made $count guesses. $guessTrack' );

                }else if (result == 1){
                  _feedback = 'TOO HIGH!';
                  _controller.clear();

                }else{
                  _feedback = 'TOO LOW!';
                  _controller.clear();

                }
              }
            });
          },
          child: Text('GUESS'),
        ),
      ],
    );
  }
}
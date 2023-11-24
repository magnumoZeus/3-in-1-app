import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayExOh =
      List.filled(9, ''); // Initialize the list with empty strings
  bool ohTurn = true; // the first player is O!
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  static var myNewFontWhite = GoogleFonts.aBeeZee(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player O', style: myNewFontWhite),
                        SizedBox(
                          height: 20,
                        ),
                        Text(ohScore.toString(), style: myNewFontWhite),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player X', style: myNewFontWhite),
                        SizedBox(
                          height: 20,
                        ),
                        Text(exScore.toString(), style: myNewFontWhite),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Center(
                      child: Text(
                        displayExOh[index],
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text('TIC TAC TOE\n  made by:', style: myNewFontWhite),
                    Text(' Qambar Abbas', style: myNewFontWhite),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'o';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'x';
        filledBoxes += 1;
      }

      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // Check for winning conditions
    // Check rows, columns, and diagonals for a winner
    if (_checkRow(0, 1, 2) ||
        _checkRow(3, 4, 5) ||
        _checkRow(6, 7, 8) ||
        _checkColumn(0, 3, 6) ||
        _checkColumn(1, 4, 7) ||
        _checkColumn(2, 5, 8) ||
        _checkDiagonal(0, 4, 8) ||
        _checkDiagonal(2, 4, 6)) {
      String winner = ohTurn ? 'X' : 'O';

      // Update the scores
      if (winner == 'O') {
        ohScore += 1;
      } else if (winner == 'X') {
        exScore += 1;
      }

      _showDialog('Winner is: $winner');
    } else if (filledBoxes == 9) {
      _showDialog('It\'s a draw!');
    }
  }

  bool _checkRow(int a, int b, int c) {
    return displayExOh[a] == displayExOh[b] &&
        displayExOh[b] == displayExOh[c] &&
        displayExOh[a] != '';
  }

  bool _checkColumn(int a, int b, int c) {
    return displayExOh[a] == displayExOh[b] &&
        displayExOh[b] == displayExOh[c] &&
        displayExOh[a] != '';
  }

  bool _checkDiagonal(int a, int b, int c) {
    return displayExOh[a] == displayExOh[b] &&
        displayExOh[b] == displayExOh[c] &&
        displayExOh[a] != '';
  }

  void _showDialog(String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('Play Again!'),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });

    filledBoxes = 0;
  }
}

import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  // positions - to store either X or O
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  // player turns
  bool xTurn = true;
  String? currentWinner;

// initial points
  int xPoint = 0;
  int oPoint = 0;

  void onTapped(int index) {
    // if there is a current-winner, we cant continue playing unless we Tap play again..
    if (currentWinner == null) {
      if (xTurn && displayXO[index] == "") {
        displayXO[index] = 'X';
        xTurn = !xTurn; // changes the player turns
      } else if (!xTurn && displayXO[index] == "") {
        displayXO[index] = 'O';
        xTurn = !xTurn; // changes the player turns
      }

      notifyListeners();
      _checkWinner(); // checks winner after every turns..
    }
  }

  // check winner
  void _checkWinner() {
    // iam checking all the possible 8 conditions
    // that leads to WINS.

    // 1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _declaireWin(displayXO[0]);
    }
    // 2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _declaireWin(displayXO[3]);
    }
    // 3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _declaireWin(displayXO[6]);
    }

    // 1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _declaireWin(displayXO[0]);
    }
    // 2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _declaireWin(displayXO[1]);
    }
    // 3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _declaireWin(displayXO[2]);
    }

    // check diagonal A
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _declaireWin(displayXO[0]);
    }
    // check diagonal B
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _declaireWin(displayXO[2]);
    }
  }

  void _declaireWin(String winner) {
    currentWinner = winner;

    // add marks
    if (winner == 'X') {
      xPoint += 1;
    } else if (winner == 'O') {
      oPoint += 1;
    }
    notifyListeners();
  }

  void resetGame() {
    displayXO = ['', '', '', '', '', '', '', '', ''];
    currentWinner = null;
    // resets all values, except the points
    notifyListeners();
  }
}

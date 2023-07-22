import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  // positions - to store either X or O
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  // player turns
  bool xTurn = true;

  void onTapped(int index) {
    if (xTurn && displayXO[index] == "") {
      displayXO[index] = 'X';
      xTurn = !xTurn; // changes the player turns
    } else if (!xTurn && displayXO[index] == "") {
      displayXO[index] = 'O';
      xTurn = !xTurn; // changes the player turns
    }

    notifyListeners();
  }
}

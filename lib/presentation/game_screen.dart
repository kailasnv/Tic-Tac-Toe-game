import 'package:exoh/game_class/game.dart';
import 'package:exoh/presentation/widgets/xo_tile.dart';
import 'package:exoh/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameProvider>(context, listen: false);

    return Scaffold(
      // appbar is used for showing a reset game icon
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => game.resetGame(),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          // score section
          Expanded(child: Consumer<GameProvider>(
            builder: (context, state, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("X ${state.xPoint.toString()}", style: gameStyle),
                  const SizedBox(width: 40),
                  Text("O ${state.oPoint.toString()}", style: gameStyle),
                ],
              );
            },
          )),

          // game pad Grid
          Expanded(
            flex: 3,
            child: Center(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return XoTile(index: index);
                },
              ),
            ),
          ),

          // additional info - shows whose turn and who WINS
          Expanded(child: Consumer<GameProvider>(
            builder: (context, state, child) {
              if (state.currentWinner != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "The Winner is ${state.currentWinner}",
                      style: gameStyle.copyWith(color: Colors.lime),
                    ),
                    // play again button
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: GestureDetector(
                        onTap: () => game.resetGame(),
                        child: Text(
                          "Play Again",
                          style: gameStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                // until anyone Wins, just shows here the turns of player
                return Center(
                  child: Text(
                    state.xTurn ? "Player X" : "Player O",
                    style: gameStyle,
                  ),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../game_class/game.dart';
import '../../utils/constants.dart';

class XoTile extends StatelessWidget {
  const XoTile({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => game.onTapped(index),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // bottom tile
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: Container(color: Colors.pink),
            ),
            // top tile - blue
            Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
            ),
            // write X or O
            Consumer<GameProvider>(
              builder: (context, state, _) {
                return Align(
                  alignment: Alignment.center,
                  child: Text(
                    state.displayXO[index],
                    style: gameStyle.copyWith(fontSize: 25),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

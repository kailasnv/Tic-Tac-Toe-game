import 'package:exoh/presentation/widgets/xo_tile.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // scrore section
          Expanded(child: Container()),

          //game pad
          Expanded(
            flex: 2,
            child: Center(
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return XoTile(index: index);
                },
              ),
            ),
          ),

          // additional info
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

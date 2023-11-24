import 'package:flutter/material.dart';
import 'package:roller_dice_game/gradient_container.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Student Group Creater'),
            backgroundColor: Colors.blueGrey,
          ),
          body: const GradientContainer(
            colors: [
              Color.fromARGB(255, 121, 231, 255),
              Color.fromARGB(255, 5, 101, 169)
            ],
          )),
    );
  }
}

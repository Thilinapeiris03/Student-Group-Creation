import 'package:flutter/material.dart';
import 'package:roller_dice_game/enter_names.dart';
import 'package:roller_dice_game/new_game.dart';


const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors, begin: beginAlignment, end: endAlignment)),
        child: const Center(child: GroupCreation()));
  }
}

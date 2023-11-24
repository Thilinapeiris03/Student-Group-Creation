import 'package:flutter/material.dart';
import 'package:roller_dice_game/enter_names.dart';

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return isButtonPressed
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const GroupCreation(),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isButtonPressed = false;
                  });
                },
                child: const Text(
                  '< Back to Home',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              )
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: const Text(
                  'Welcome to\n Student Group Creater!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purple, fontSize: 30),
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isButtonPressed = true;
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20)),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Enter Your Student Names here', style: TextStyle(fontSize: 10)),
                  ))
            ],
          );
  }
}

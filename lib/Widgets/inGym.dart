import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_speed/Widgets/Home.dart';
import 'package:gym_speed/Widgets/scripts/consts/Data.dart';
import 'package:gym_speed/Widgets/scripts/timePerUnit.dart';
import 'scripts/Late.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget inGymLocal(Widget timer, ExerciceMember exercices) {
  String exercice = exercices == ExerciceMember.arm ? "braco" : "perna";

  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 19, 19, 19),
    appBar: AppBar(
      title: const Text(titleApplication),
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: Text(exercice,
              style: defaultTextStyle),
          ),
          Late(),
          Container(
            margin: const EdgeInsets.all(30),
            child:
                LoadingAnimationWidget.inkDrop(color: Colors.white, size: 100),
          ),
          timer,
        ],
      ),
    ),
  );
}

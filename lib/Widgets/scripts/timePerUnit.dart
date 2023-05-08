import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_speed/Widgets/Home.dart';
import 'package:gym_speed/Widgets/scripts/consts/Data.dart';

const int baseSecounds = 60;
Stream<int> timerStream = Stream<int>.value(1);
int timerStacked = 0;
String? showExercice;
int oldTimerStacked = timerStacked;
bool pause = false;
String nextExercice = "";
List<String> exercices = [];
int repeatTime = 1;
bool pauseStream = false;
int oldTime = 0;

void update(int? snapshot) {
  int timerStackedNext = timerStacked + 1;
  
  if(snapshot == baseSecounds && !pause) {
    timerStacked++;
  } else if(snapshot == baseSecounds) {
    repeatTime++;
  }

  if(timerStacked < exercices.length) {
    showExercice = exercices[timerStacked];
      if(timerStackedNext < exercices.length) {
        nextExercice = exercices[timerStackedNext];
      } else{
        nextExercice = "end";
      }
  }

  if(repeatTime > repeatExercice) {
    repeatTime = 1;
  }

  if(pause && snapshot == baseSecounds) {
      oldTimerStacked = timerStacked;
      pause = false;
    }  
}

void setExercices(ExerciceMember exercice) {
  if(exercice == ExerciceMember.arm) {
    for(int i = 0; i < exerciceArm.length; i++) {
      for(int j = 0; j < repeatExercice; j++) {
        exercices.add(exerciceArm[i]);
      }
    }
  } else {
    for(int i = 0; i < exerciceLeg.length; i++) {
      for(int j = 0; j < repeatExercice; j++) {
        exercices.add(exerciceLeg[i]);
      }
    }
  }

  exercices.add("end");
}

Widget newExercice(ExerciceMember exercice) {
  return StreamBuilder<int>(
            stream: timerStream,
            builder: (context, snapshot) {
              update(snapshot.data);
              if (snapshot.hasData) {
                if(showExercice == "end"){
                  return const Text("end", style: defaultTextStyle);
                }

                if(timerStacked != oldTimerStacked) {
                  pause = true;
                  return Text("pause, next is: $showExercice - ${snapshot.data}s", style: defaultTextStyle);
                } 

                return Column(
                  children: [
                    Text("${snapshot.data}s - $showExercice $repeatTime/$repeatExercice\nnext: $nextExercice", style: defaultTextStyle),
                    ElevatedButton(onPressed: () => {
                      pauseStream = !pauseStream,
                      oldTime = snapshot.data as int,
                    },style: defaultButtonStyle, child: const Text("Pause", style: defaultTextkStyle)),
                  ],
                );
              } else {
                return const Text("Loading...", style: defaultTextStyle);
              }
            },
          );
}
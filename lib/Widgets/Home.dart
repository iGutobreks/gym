// ignore: unnecessary_import
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_speed/Widgets/inGym.dart';
import 'scripts/timePerUnit.dart';
import 'scripts/consts/Data.dart';

DateTime reachTime = DateTime(
    DateTime.now().year, DateTime.now().month, DateTime.now().day, 15, 10);
DateTime limitTime = DateTime(
    DateTime.now().year, DateTime.now().month, DateTime.now().day, 15, 50);

int exercicesMake = 0;
const String titleApplication = "gym speed";

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 36.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      )),
      home: const HomeWidget(),
    );
  }
}

// ignore: must_be_immutable
class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _HomeWidget();
}

class _HomeWidget extends State<HomeWidget> {
  bool localGym = false;
  bool isChoose = false;
  ExerciceMember chooseExercice = ExerciceMember.arm;

  @override
  void initState() {
    super.initState();
    timerStream = Stream<int>.periodic(const Duration(milliseconds: 1000),
        (timer) => pauseStream == true ? oldTime : timer % baseSecounds + 1);
  }

  @override
  Widget build(BuildContext context) {
    if (localGym) {
      if (!isChoose) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 19, 19, 19),
          appBar: AppBar(
            title: const Text(titleApplication),
            backgroundColor: const Color.fromARGB(255, 19, 19, 19),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => setState(() {
                          chooseExercice = ExerciceMember.arm;
                          isChoose = true;
                          exercicesMake = exerciceArm.length;
                        }),
                    style: defaultButtonStyle,
                    child: const Text("braco",
                        style: defaultTextsubStyle)),
                ElevatedButton(
                    onPressed: () => setState(() {
                          chooseExercice = ExerciceMember.leg;
                          isChoose = true;
                          exercicesMake = exerciceLeg.length;
                        }),
                    style: defaultButtonStyle,
                    child: const Text("perna",
                        style: defaultTextsubStyle))
              ],
            ),
          ),
        );
      } else {
        setExercices(chooseExercice);
        return inGymLocal(newExercice(chooseExercice), chooseExercice);
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      appBar: AppBar(
        title: const Text(titleApplication),
        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              "horario padrao de chegada: ${reachTime.hour}:${reachTime.minute}",
              style: defaultTextlStyle),
          ElevatedButton(
            onPressed: () {
              setState(() {
                localGym = true;
              });
            },
            style: defaultButtonStyle,
            child: const Text(
              "eu cheguei agora!",
              style: defaultTextbStyle,
            ),
          ),
        ]),
      ),
    );
  }
}

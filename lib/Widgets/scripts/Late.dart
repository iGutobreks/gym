// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gym_speed/Widgets/Home.dart';
import 'hourMParse.dart';

DateTime reachedTime = DateTime.now();
int diff = reachedTime.difference(reachTime).inMinutes;

Widget Late() {
  const defaultStyleText = TextStyle(color: Colors.white, fontSize: 16.0);
  double exercice_unit = diff_hour_minutes(reachedTime) / exercicesMake;
  Widget minutes_for_unit = Text("voce tem ${diff_hour_minutes(reachedTime)} minutos para fazer seus exercicios", style: defaultStyleText);

  Widget defaultRet = Column(
    children: [
      minutes_for_unit,
      Text("por exercicio voce tem $exercice_unit minutos", style: defaultStyleText),
    ],
  );

  if(diff.isNegative) {
    return Column(
      children: [
        Text("voce chegou cedo ${diff.abs()} minutos", style: defaultStyleText),
        defaultRet
      ],
    );
  } else if(diff == 0) {
    return Column(
      children: [
        const Text("voce esta atrasado", style: defaultStyleText),
        defaultRet
      ],
    );
  }

  return Column(
    children: [
      Text("voce esta atrasado $diff minutos", style: defaultStyleText),
      defaultRet
    ],
  );
}
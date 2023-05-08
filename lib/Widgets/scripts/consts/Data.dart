// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ExerciceMember {
  arm,
  leg,
}

List<String> exerciceArm = ["Peck Deck", "Puxador Triangulo", "Remada", "Triciples"];
List<String> exerciceLeg = ["Leg Cima", "Leg Sentado", "Leg Baixo", "Gemeos", "Panturilha"];

const int pausePerExercice = 1 * 100000;
const int repeatExercice = 4;

const TextStyle defaultTextStyle = TextStyle(color: Colors.white, fontSize: 26.0);
const TextStyle defaultTextsubStyle = TextStyle(color: Colors.black, fontSize: 16.0);
const TextStyle defaultTextlStyle = TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle defaultTextbStyle = TextStyle(color: Colors.black);
const TextStyle defaultTextkStyle = TextStyle(color: Colors.black, fontSize: 16.0);
const Color defaultBackgroundStyle = Color.fromARGB(255, 30, 30, 30);
ButtonStyle defaultButtonStyle = ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)); 
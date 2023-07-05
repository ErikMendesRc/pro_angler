import 'package:flutter/material.dart';
import 'package:pro_angler/Util/cores.dart';

class CustomTextStyles {

  static const TextStyle titleText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: CoresPersonalizada.corTextoDestaque,
  );

    static const TextStyle subtitleText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: CoresPersonalizada.corTextoDestaque,
  );

  static const TextStyle sessionTitles = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: CoresPersonalizada.corTextoDestaque,
  );

  static const TextStyle sessionTitlesWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255),
  );

    //Cards Horizontal
    static const TextStyle cardsTitles = TextStyle(
    fontSize: 16,
    color: CoresPersonalizada.textWhite,
  );

  static const TextStyle cardsSubTitles = TextStyle(
    fontSize: 12,
    color: CoresPersonalizada.textWhite,
  );

  static const TextStyle cardsTexts = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: CoresPersonalizada.textWhite,
  );

  //Card de Criação de torneios
  static const TextStyle cardTournamentTitle= TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: CoresPersonalizada.textWhite,
  );

  static const TextStyle cardTournamentSubTitle = TextStyle(
    fontSize: 14,
    color: CoresPersonalizada.textWhite,
  );
}

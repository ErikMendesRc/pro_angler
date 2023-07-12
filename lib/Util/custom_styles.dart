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

  static const TextStyle text20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: CoresPersonalizada.corTextoDestaque,
  );

    //Cards Horizontal
    static const TextStyle texto16Normal = TextStyle(
    fontSize: 16,
    color: CoresPersonalizada.white,
  );

  static const TextStyle texto16Bold = TextStyle(
    fontSize: 16,
    color: CoresPersonalizada.white,
    fontWeight: FontWeight.bold
  );

  static const TextStyle texto16BoldUnderline = TextStyle(
    fontSize: 15,
    color: CoresPersonalizada.white,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline
  );

  static const TextStyle cardsSubTitles = TextStyle(
    fontSize: 12,
    color: CoresPersonalizada.white,
  );

  static const TextStyle cardsTexts = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: CoresPersonalizada.white,
  );

  //Card de Criação de torneios
  static const TextStyle cardTournamentTitle= TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: CoresPersonalizada.white,
  );

  static const TextStyle texto14Normal = TextStyle(
    fontSize: 14,
    color: CoresPersonalizada.white,
  );

  //Cards Troféus e Conquistas

  static const TextStyle destaque14Bold= TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: CoresPersonalizada.white,
  );

  static const TextStyle texto12Branco = TextStyle(
    fontSize: 12,
    color: CoresPersonalizada.white,
  );

  static const TextStyle texto12BrancoBold = TextStyle(
    fontSize: 12,
    color: CoresPersonalizada.white,
    fontWeight: FontWeight.bold
  );

  static const TextStyle profileLocal = TextStyle(
    fontSize: 16,
    color: CoresPersonalizada.white,
  );
}


import "package:flutter/material.dart";

import 'package:mythical_battles/screens/main_page/main_page.dart';
import 'package:mythical_battles/screens/battle_page/battle_page.dart';
import 'package:mythical_battles/screens/combat_page/combat_page.dart';

import 'screens/battle_page/battle_result_page.dart';

enum Screen {
  MAIN_PAGE,
  BATTLE_PAGE,
  COMBAT_PAGE,
  RESULT_PAGE
}

class ChangePage {

  static ToSetterPage(context, Screen screen) {
    switch(screen) {
      case Screen.MAIN_PAGE:
        ToMainPage(context);
        break;
      case Screen.BATTLE_PAGE:
        ToBattlePage(context);
        break;
      case Screen.COMBAT_PAGE:
        ToCombatPage(context);
        break;
      case Screen.RESULT_PAGE:
        ToResultPage(context);
        break;
    }
  }

  static ToMainPage(context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  static ToBattlePage(context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BattlePage()),
    );
  }

  static ToCombatPage(context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CombatPage()),
    );
  }

  static ToResultPage(context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BattleResultPage()),
    );
  }
}
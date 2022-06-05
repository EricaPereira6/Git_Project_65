
import 'dart:math';

import 'constants.dart';

class GameController {

  static Map<Heroes, int> Fight(Heroes hero, Heroes enemy){

    int heroLife = Constants.heroGameStats[hero]![0];
    int heroForce = Constants.heroGameStats[hero]![1];
    int enemyLife = Constants.enemyGameStats[enemy]![0];
    int enemyForce = Constants.enemyGameStats[enemy]![1];
    Elements? heroElement = Constants.heroesElement[hero];
    Elements? enemyElement = Constants.heroesElement[enemy];

    if ((heroElement == Elements.WATER && enemyElement == Elements.FIRE) ||
        (heroElement == Elements.FIRE && enemyElement == Elements.AIR) ||
        (heroElement == Elements.AIR && enemyElement == Elements.EARTH) ||
        (heroElement == Elements.EARTH && enemyElement == Elements.WATER)) {
      heroForce++;
    }
    else if ((enemyElement == Elements.WATER && heroElement == Elements.FIRE) ||
        (enemyElement == Elements.FIRE && heroElement == Elements.AIR) ||
        (enemyElement == Elements.AIR && heroElement == Elements.EARTH) ||
        (enemyElement == Elements.EARTH && heroElement == Elements.WATER))  {
      enemyForce++;
    }

    heroLife = heroLife - enemyForce;
    enemyLife = enemyLife - heroForce;

    Map<Heroes, int> defeated = {};

    //List<Heroes> defeated = [];
    if (heroLife <= 0) {
      defeated[hero] = heroLife;
    }
    if (enemyLife <= 0) {
      defeated[enemy] = enemyLife;
    }
    for (final mapEntry in defeated.entries) {
      final key = mapEntry.key;
      final value = mapEntry.value;
      print('Key: $key, Value: $value');  // Key: a, Value: 1 ...
    }

    Constants.heroGameStats[hero]![0] = max(heroLife, 0);
    Constants.enemyGameStats[enemy]![0] = max(enemyLife, 0);


    return defeated;

  }

}
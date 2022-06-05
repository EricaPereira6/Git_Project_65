import "package:flutter/material.dart";

enum Quadrants {
  TOP_LEFT,
  TOP_RIGHT,
  BOTTOM_LEFT,
  BOTTOM_RIGHT
}
enum Buttons {
  BATALHA,
  DEFINICOES,
  LOJA,
  BOLSA
}

enum Elements {
  AIR,
  FIRE,
  WATER,
  EARTH
}

enum Heroes {
  ADA_LOVELACE, ARQUIMEDES, MARIE_CURIE,
  AFRODITE, DIONISIO, EUTERPE, HADES, POSEIDON, THALIA,
  AMATERASU, TSUKUYOMI,
  ANUBIS, FENIX, HATHOR,
  DURGA, NAGA_KANYA,
  ELFO, LOKI, VALKIRIA,
  KAULU, MAUI, PELE,
  LONG_MU, SUN_WUKONG,

}

class Constants {

  static bool won = true;

  static const String audioBatalha = "assets/audio/batalha_PT_female.mp3";
  static const String audioDefinicoes = "assets/audio/definicoes_PT_female.mp3";
  static const String audioLoja = "assets/audio/loja_PT_female.mp3";
  static const String audioBolsa = "assets/audio/bolsa_PT_female.mp3";

  static const String audioButton = "assets/audio/button.mp3";
  static const String audioVictory = "assets/audio/victory.mp3";

  static const String audioCombater = "assets/audio/combater_PT_female.mp3";
  static const String audioPlay = "assets/audio/play_PT_female.mp3";


  static double screenWidth = 0;
  static double screenHeight = 0;

  static setScreenWidth(double width) {
    screenWidth = width;
  }

  static setScreenHeight(double height) {
    screenHeight = height;
  }

  static const Color fireColor = Colors.redAccent;
  static const Color airColor = Colors.yellow;
  static const Color waterColor = Colors.blueAccent;
  static const Color earthColor = Colors.greenAccent;

  static const Color screenColor1 = Color.fromRGBO(104, 124, 148, 1);
  static const Color screenColor2 = Color.fromRGBO(255, 200, 100, 1);

  static const String rewardTitle = "Recompensas";

  static const List<String> mainPageTitles = ["Batalha", "Definições", "Loja", "Bolsa"];
  static const List<String> battlePageTitles = ["Selecionar Heróis", "Ver Oponentes",
                                    "Regras do Jogo", "Combater"];


  static const String rewardImageSrc = "assets/image/main_page/bau.png";
  static const String faixaImageSrc = "assets/image/faixa.png";

  static const String playImageSrc = "assets/image/play.png";
  static const String autoplayImageSrc = "assets/image/autoplay.png";

  static const String heroLevelImageSrc = "assets/image/hero_level.png";
  static const String enemyLevelImageSrc = "assets/image/enemy_level.png";
  static const String heroStatsImageSrc = "assets/image/hero_stats.png";
  static const String enemyStatsImageSrc = "assets/image/enemy_stats.png";
  static const String heartStatsImageSrc = "assets/image/heart.png";

  static const List<String> mainPageImageSrcs = ["assets/image/main_page/batalha.png",
                                    "assets/image/main_page/definicoes1.png",
                                    "assets/image/main_page/loja.png",
                                    "assets/image/main_page/bolsa.png"];

  static const List<String> battlePageImageSrcs = ["assets/image/battle_page/hero.png",
                                    "assets/image/battle_page/enemy.png",
                                    "assets/image/battle_page/book1.png",
                                    "assets/image/battle_page/combate.png"];

  static const List<String> numbersImage = ["assets/image/number/zero.png",
                                    "assets/image/number/one.png",
                                    "assets/image/number/two.png",
                                    "assets/image/number/three.png",
                                    "assets/image/number/four.png",
                                    "assets/image/number/five.png",
                                    "assets/image/number/six.png",
                                    "assets/image/number/seven.png",
                                    "assets/image/number/eight.png",
                                    "assets/image/number/nine.png"];

  static const List<String> negativeNumbersImage = ["assets/image/number/m_zero.png",
                                    "assets/image/number/m_one.png",
                                    "assets/image/number/m_two.png",
                                    "assets/image/number/m_three.png",
                                    "assets/image/number/m_four.png",
                                    "assets/image/number/m_five.png",
                                    "assets/image/number/m_six.png",
                                    "assets/image/number/m_seven.png",
                                    "assets/image/number/m_eight.png",
                                    "assets/image/number/m_nine.png"];

  static const Map <Heroes, String> heroesImageSrc = {Heroes.ANUBIS: "assets/image/heroes/anubis.png",
                                          Heroes.AFRODITE: "assets/image/heroes/athena.png",
                                          Heroes.AMATERASU: "assets/image/heroes/amaterasu.png",
                                          Heroes.DURGA: "assets/image/heroes/durga.png",
                                          Heroes.HATHOR: "assets/image/heroes/hathor.png",
                                          Heroes.LOKI: "assets/image/heroes/loki.png",
                                          Heroes.POSEIDON: "assets/image/heroes/poseidon.png",
                                          Heroes.VALKIRIA: "assets/image/heroes/valkiria.png"};

  static const Map <Heroes, String> heroesImageSrcInverted = {Heroes.ANUBIS: "assets/image/heroes/anubis_inv.png",
                                          Heroes.AFRODITE: "assets/image/heroes/athena_inv.png",
                                          Heroes.AMATERASU: "assets/image/heroes/amaterasu_inv.png",
                                          Heroes.DURGA: "assets/image/heroes/durga_inv.png",
                                          Heroes.HATHOR: "assets/image/heroes/hathor_inv.png",
                                          Heroes.LOKI: "assets/image/heroes/loki_inv.png",
                                          Heroes.POSEIDON: "assets/image/heroes/poseidon_inv.png",
                                          Heroes.VALKIRIA: "assets/image/heroes/valkiria_inv.png"};

  static const Map <Heroes, Elements> heroesElement = {Heroes.ANUBIS: Elements.WATER,
                                          Heroes.AFRODITE: Elements.AIR,
                                          Heroes.AMATERASU: Elements.FIRE,
                                          Heroes.DURGA: Elements.EARTH,
                                          Heroes.HATHOR: Elements.EARTH,
                                          Heroes.LOKI: Elements.FIRE,
                                          Heroes.POSEIDON: Elements.WATER,
                                          Heroes.VALKIRIA: Elements.AIR};

  static Map <Heroes, String> heroName = {Heroes.ANUBIS: "anubis",
    Heroes.AFRODITE: "afrodite",
    Heroes.HATHOR: "hathor",
    Heroes.AMATERASU: "amaterasu",
    Heroes.LOKI: "loki",
    Heroes.DURGA: "durga",
    Heroes.POSEIDON: "poseidon",
    Heroes.VALKIRIA: "valkiria"};

  static const heroesStats = {Heroes.ANUBIS: [ 3, 4],
    Heroes.AFRODITE: [ 4, 3],
    Heroes.AMATERASU: [ 4, 3],
    Heroes.DURGA: [ 3, 3],
    Heroes.HATHOR: [ 3, 1],
    Heroes.LOKI: [ 1, 3],
    Heroes.POSEIDON: [ 3, 4],
    Heroes.VALKIRIA: [ 2, 3],
  };

  static var heroGameStats = {Heroes.ANUBIS: [ 3, 4],
    Heroes.AFRODITE: [ 4, 3],
    Heroes.AMATERASU: [ 4, 3],
    Heroes.DURGA: [ 3, 3],
    Heroes.HATHOR: [ 3, 1],
    Heroes.LOKI: [ 1, 3],
    Heroes.POSEIDON: [ 3, 4],
    Heroes.VALKIRIA: [ 2, 3],
  };
  static var enemyGameStats = {Heroes.ANUBIS: [ 3, 4],
    Heroes.AFRODITE: [ 4, 3],
    Heroes.AMATERASU: [ 4, 3],
    Heroes.DURGA: [ 3, 3],
    Heroes.HATHOR: [ 3, 1],
    Heroes.LOKI: [ 1, 3],
    Heroes.POSEIDON: [ 3, 4],
    Heroes.VALKIRIA: [ 2, 3],
  };

  static refreshStats() {
    for (final map in heroesStats.entries) {
      heroGameStats[map.key]![0] = map.value[0];
      heroGameStats[map.key]![1] = map.value[1];
      enemyGameStats[map.key]![0] = map.value[0];
      enemyGameStats[map.key]![1] = map.value[1];
    }
  }

  static const List<Heroes> heroesSequence = [Heroes.ANUBIS, Heroes.AFRODITE,
                                      Heroes.HATHOR, Heroes.AMATERASU];
  static const List<Heroes> enemiesSequence = [Heroes.LOKI, Heroes.DURGA,
                                      Heroes.POSEIDON, Heroes.AFRODITE];

  static const int changeColortime = 800;

  static const String vencedorImageScr = "assets/image/vencedor.png";
  static const String perdedorImageScr = "assets/image/vencedor.png";
  static const String gemImageScr = "assets/image/gem.png";
  static const String pontosFusaoImageScr = "assets/image/pontos_fusao.png";
  static const String expImageScr = "assets/image/exp.png";


  // Map<Buttons, String> portugues = {Buttons.BATALHA: audioBatalha,
  //                                   Buttons.DEFINICOES: audioDefinicoes,
  //                                   Buttons.LOJA: audioLoja,
  //                                   Buttons.BOLSA: audioBolsa};
}

import "package:flutter/material.dart";

import 'package:mythical_battles/constants.dart';
import 'package:mythical_battles/audio.dart';

import '../../change_page.dart';
import '../../game_controller.dart';

class CombatPage extends StatefulWidget {
  const CombatPage({Key? key}) : super(key: key);

  @override
  _CombatPageState createState() => _CombatPageState();

}

class _CombatPageState extends State<CombatPage> with TickerProviderStateMixin {

  late Animation<Color?> backgroundHeroAnimation;
  late Animation<Color?> backgroundEnemyAnimation;
  late Animation<double> heroLostAnimation;
  late Animation<double> enemyLostAnimation;

  late AnimationController heroColorController;
  late AnimationController enemyColorController;
  late AnimationController heroLostController;
  late AnimationController enemyLostController;

  int heroIndex = 0;
  int enemyIndex = 0;
  int heroLostPoints = 0;
  int enemyLostPoints = 0;
  double heroLostPointsWidth = 0;
  double enemyLostPointsWidth = 0;

  List<String?> heroesImageSrcs = [Constants.heroesImageSrc[Heroes.ANUBIS],
    Constants.heroesImageSrc[Heroes.AFRODITE],
    Constants.heroesImageSrc[Heroes.HATHOR],
    Constants.heroesImageSrc[Heroes.AMATERASU]];

  List<String?> enemiesImageSrcs = [Constants.heroesImageSrc[Heroes.LOKI],
    Constants.heroesImageSrc[Heroes.DURGA],
    Constants.heroesImageSrc[Heroes.POSEIDON],
    Constants.heroesImageSrc[Heroes.AFRODITE]];

  late String? heroImageSrc;
  late String? enemyImageSrc;
  List<Color> heroesColors = [Constants.waterColor, Constants.airColor,
    Constants.earthColor, Constants.fireColor];
  List<Color> enemiesColors = [Constants.fireColor, Constants.earthColor,
    Constants.waterColor, Constants.airColor];


  Quadrants? lastQuadTouched;

  @override
  void initState() {
    super.initState();
    heroImageSrc = heroesImageSrcs[heroIndex];
    enemyImageSrc = enemiesImageSrcs[enemyIndex];

    heroColorController =
        AnimationController(duration: const Duration(milliseconds: Constants.changeColortime), vsync: this);
    backgroundHeroAnimation = ColorTween(begin: heroesColors[0], end: heroesColors[1])
        .animate(heroColorController)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });

    //backgroundAnimation = RainbowColorTween(heroesColors).animate(controller)
    enemyColorController =
        AnimationController(duration: const Duration(milliseconds: Constants.changeColortime), vsync: this);
    backgroundEnemyAnimation = ColorTween(begin: enemiesColors[0], end: enemiesColors[1])
        .animate(enemyColorController)
       ..addListener(() {
         setState(() {
           // The state that has changed here is the animation object’s value.
         });
       });

    heroLostController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    heroLostAnimation = Tween<double>(begin: (Constants.screenWidth / 8),
        end: (Constants.screenWidth / 10))
        .animate(heroLostController)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    heroLostAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        heroLostPointsWidth = 0;
        heroLostController.reset();
      }
    });

    enemyLostController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    enemyLostAnimation = Tween<double>(begin: (Constants.screenWidth / 8),
        end: (Constants.screenWidth / 10))
        .animate(enemyLostController)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });

    enemyLostAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        enemyLostPointsWidth = 0;
        enemyLostController.reset();
      }
    });
  }

  void UpdateGame(Map<Heroes, int> defeated) {
    int i = 0;
    for (final mapEntry in defeated.entries) {
      if (mapEntry.key == Constants.heroesSequence[heroIndex]) {
        heroLostPoints = mapEntry.value * (-1);
        heroIndex++;
        if (heroIndex < 4){
          backgroundHeroAnimation = ColorTween(begin: heroesColors[heroIndex],
              end: heroesColors[(heroIndex<3)?heroIndex+1:0]).animate(heroColorController)
            ..addListener(() {
              setState(() {
                // The state that has changed here is the animation object’s value.
              });
            });
          heroColorController.forward();
          heroImageSrc = heroesImageSrcs[heroIndex];
          heroColorController.reset();
          heroLostPointsWidth = (Constants.screenWidth / 8);
          heroLostController.forward();
        }
        else {
          heroIndex = 0;
          enemyIndex = 0;
          heroLostPoints = 0;
          enemyLostPoints = 0;
          heroLostPointsWidth = 0;
          enemyLostPointsWidth = 0;
          //Audio.play(Constants.audioVictory);
          ChangePage.ToResultPage(context);
          break;
        }

      }
      else {
        enemyLostPoints = mapEntry.value * (-1);
        enemyIndex++;
        if (enemyIndex < 4){
          backgroundEnemyAnimation = ColorTween(begin: enemiesColors[enemyIndex],
              end: enemiesColors[(enemyIndex<3)?enemyIndex+1:0]).animate(enemyColorController)
            ..addListener(() {
              setState(() {
                // The state that has changed here is the animation object’s value.
              });
            });
          enemyColorController.forward();
          enemyImageSrc = enemiesImageSrcs[enemyIndex];
          enemyColorController.reset();
          enemyLostPointsWidth = (Constants.screenWidth / 8);
          enemyLostController.forward();
        }
        else {
          heroIndex = 0;
          enemyIndex = 0;
          heroLostPoints = 0;
          enemyLostPoints = 0;
          heroLostPointsWidth = 0;
          enemyLostPointsWidth = 0;
          Audio.play(Constants.audioVictory);
          ChangePage.ToResultPage(context);
          break;
        }
      }
      i++;
      if (i == defeated.length) {
        Audio.play(Constants.audioButton);
      }
    }
  }

  CombatCornerContainer (constaint, Quadrants quad, Color background, {String? imageSrc}) {
    if (imageSrc == null) {
      quad = Quadrants.BOTTOM_RIGHT;
    }
    switch(quad) {
      case Quadrants.TOP_LEFT:
      case Quadrants.TOP_RIGHT:
        return Container(color: background,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: (Constants.screenHeight / 30),),
              Image(image: AssetImage(imageSrc!), height: (Constants.screenHeight / 20)),
            ],
          ),
        );

      case Quadrants.BOTTOM_LEFT:
      case Quadrants.BOTTOM_RIGHT:
        return Container(color: background,);
    }
  }

  BackgroundWidget (constaint, context, Color? heroBgColor, Color? enemyColor) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: constaint.maxWidth / constaint.maxHeight,
      ),

      children: <Widget>[

        InkWell(
          onTap: () {
            if (lastQuadTouched == Quadrants.TOP_LEFT) {
              Map<Heroes,int> defeated = GameController.Fight(
                  Constants.heroesSequence[heroIndex],
                  Constants.enemiesSequence[enemyIndex]);

              if (defeated.isNotEmpty) {
                UpdateGame(defeated);
              }
              lastQuadTouched = null;
            }
            else {
              Audio.play(Constants.audioPlay);
              lastQuadTouched = Quadrants.TOP_LEFT;
            }
          },
          child:
          CombatCornerContainer (constaint, Quadrants.TOP_LEFT,
              heroBgColor!, imageSrc: Constants.playImageSrc),
        ),

        InkWell(
          onTap: () {
            if (lastQuadTouched == Quadrants.TOP_RIGHT) {
              lastQuadTouched = null;
            }
            else {
              lastQuadTouched = Quadrants.TOP_RIGHT;
            }
          },
          child:
          CombatCornerContainer (constaint, Quadrants.TOP_RIGHT,
              enemyColor!, imageSrc: Constants.autoplayImageSrc),
        ),

        InkWell(
          onTap: () {
            if (lastQuadTouched == Quadrants.BOTTOM_LEFT) {
              lastQuadTouched = null;
            }
            else {
              lastQuadTouched = Quadrants.BOTTOM_LEFT;
            }
          },
          child:
          CombatCornerContainer (constaint, Quadrants.BOTTOM_LEFT, heroBgColor),
        ),

        InkWell(
          onTap: ()  {
            if (lastQuadTouched == Quadrants.BOTTOM_RIGHT) {
              lastQuadTouched = null;
            }
            else {
              lastQuadTouched = Quadrants.BOTTOM_RIGHT;
            }
          },
          child:
          CombatCornerContainer (constaint, Quadrants.BOTTOM_RIGHT, enemyColor),
        ),
      ],
    );
  }

  CombatWidget (constaint, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: <Widget>[
                Image(
                  image: const AssetImage(Constants.heroLevelImageSrc),
                  height: (Constants.screenHeight / 25),),
                Row(
                    children: [
                      const SizedBox(width: 30,),
                      Image(image: AssetImage(Constants.numbersImage[1]),
                        height: (Constants.screenHeight / 30),),
                    ]
                )

              ],
            ),
            Stack(
              children: <Widget>[
                Image(
                  image: const AssetImage(Constants.enemyLevelImageSrc),
                  height: (Constants.screenHeight / 25),),
                Row(
                    children: [
                      const SizedBox(width: 30,),
                      Image(image: AssetImage(Constants.numbersImage[1]),
                        height: (Constants.screenHeight / 30),),
                    ]
                )

              ],
            ),
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image(image: AssetImage(heroImageSrc!), width: (Constants.screenWidth / 6),),
                    Column(
                      children: <Widget>[
                        SizedBox(height: heroLostAnimation.value,),
                        Image(image: AssetImage(Constants.negativeNumbersImage[heroLostPoints]),
                          width: heroLostPointsWidth,),
                      ],
                    ),
                    ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image(image: const AssetImage(Constants.heartStatsImageSrc),
                          height: (Constants.screenHeight / 25),),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 15,),
                            Image(image: AssetImage(Constants.numbersImage[
                            Constants.heroGameStats[Constants.heroesSequence[heroIndex]]![0]
                            ]),
                              height: (Constants.screenHeight / 35),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 15,),
                    Stack(
                      children: <Widget>[
                        Image(image: const AssetImage(Constants.heroStatsImageSrc),
                          height: (Constants.screenHeight / 25),),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 15,),
                            Image(image: AssetImage(Constants.numbersImage[
                            Constants.heroGameStats[Constants.heroesSequence[heroIndex]]![1]
                            ]),
                              height: (Constants.screenHeight / 35),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15,)
              ],
            ),
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image(image: AssetImage(enemyImageSrc!), width: (Constants.screenWidth / 6),),
                    Column(
                      children: <Widget>[
                        SizedBox(height: enemyLostAnimation.value,),
                        Image(image: AssetImage(Constants.negativeNumbersImage[enemyLostPoints]),
                          width: enemyLostPointsWidth,),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image(image: const AssetImage(Constants.heartStatsImageSrc),
                          height: (Constants.screenHeight / 25),),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 15,),
                            Image(image: AssetImage(Constants.numbersImage[
                            Constants.enemyGameStats[Constants.enemiesSequence[enemyIndex]]![0]
                            ]),
                              height: (Constants.screenHeight / 35),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 15,),
                    Stack(
                      children: <Widget>[
                        Image(image: const AssetImage(Constants.enemyStatsImageSrc),
                          height: (Constants.screenHeight / 25),),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 15,),
                            Image(image: AssetImage(Constants.numbersImage[
                            Constants.enemyGameStats[Constants.enemiesSequence[enemyIndex]]![1]
                            ]),
                              height: (Constants.screenHeight / 35),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15,)
              ],
            ),
          ]
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {},
          child:
          const Center(child: Text('Página de Combate')),
        ),
      ),
      body:
      LayoutBuilder(
        builder: (context, constaint) {
          return Stack(
            children: <Widget>[
              BackgroundWidget(
                  constaint, context, backgroundHeroAnimation.value,
                  backgroundEnemyAnimation.value),
              CombatWidget(constaint, context),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    heroColorController.dispose();
    enemyColorController.dispose();
    heroLostController.dispose();
    enemyLostController.dispose();
    super.dispose();
  }
}
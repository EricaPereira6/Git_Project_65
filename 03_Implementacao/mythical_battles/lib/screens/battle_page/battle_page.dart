import "package:flutter/material.dart";

import 'package:mythical_battles/constants.dart';
import 'package:mythical_battles/audio.dart';
import 'package:mythical_battles/widget_builder.dart';

import '../../change_page.dart';

class BattlePage extends StatefulWidget {
  const BattlePage({Key? key}) : super(key: key);

  @override
  _BattlePageState createState() => _BattlePageState();

}

class _BattlePageState extends State<BattlePage> {


  Quadrants? lastQuadTouched;

  BackgroundWidget (constaint, context, List<String> titles, List<String> imageSrcs) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: constaint.maxWidth / constaint.maxHeight,
      ),

      children: <Widget>[

        InkWell(
          onTap: () {
            if (lastQuadTouched == Quadrants.TOP_LEFT) {
              Audio.play(Constants.audioButton);
              lastQuadTouched = null;
              //change screen
            }
            else {
              lastQuadTouched = Quadrants.TOP_LEFT;
            }
          },
          child:
          WidgetBuilderFunctions.CornerContainer (constaint, Quadrants.TOP_LEFT,
              Constants.screenColor1,
              titles[0], imageSrcs[0]),
        ),

        InkWell(
          onTap: () {
            if (lastQuadTouched == Quadrants.TOP_RIGHT) {
              Audio.play(Constants.audioButton);
              lastQuadTouched = null;
              //change screen
            }
            else {
              lastQuadTouched = Quadrants.TOP_RIGHT;
            }
          },
          child:
          WidgetBuilderFunctions.CornerContainer (constaint, Quadrants.TOP_RIGHT,
              Constants.screenColor2,
              titles[1], imageSrcs[1]),
        ),

        InkWell(
          onTap: () {
            if (lastQuadTouched == Quadrants.BOTTOM_LEFT) {
              Audio.play(Constants.audioButton);
              lastQuadTouched = null;
              //change screen
            }
            else {
              lastQuadTouched = Quadrants.BOTTOM_LEFT;
            }
          },
          child:
          WidgetBuilderFunctions.CornerContainer (constaint, Quadrants.BOTTOM_LEFT,
              Constants.screenColor2,
              titles[2], imageSrcs[2]),
        ),

        InkWell(
          onTap: ()  {
            if (lastQuadTouched == Quadrants.BOTTOM_RIGHT) {
              Audio.play(Constants.audioButton);
              lastQuadTouched = null;
              //change screen
              ChangePage.ToCombatPage(context);
            }
            else {
              Audio.play(Constants.audioCombater);
              lastQuadTouched = Quadrants.BOTTOM_RIGHT;
            }
          },
          child:
          WidgetBuilderFunctions.CornerContainer (constaint, Quadrants.BOTTOM_RIGHT,
              Constants.screenColor1,
              titles[3], imageSrcs[3]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    //Constants.gameStats = Constants.heroesStats;
    // Audio.play(Constants.audioBatalha);

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: ()  {Audio.play(Constants.audioBatalha);},
          child:
          const Center(child: Text('Página Combate')),
        ),
      ),
      body:
      LayoutBuilder(
        builder: (context, constaint) {
          return Stack(
            children: <Widget>[
              BackgroundWidget(constaint, context,
                  Constants.battlePageTitles, Constants.battlePageImageSrcs),
            ],
          );
        },
      ),
    );

  }
}
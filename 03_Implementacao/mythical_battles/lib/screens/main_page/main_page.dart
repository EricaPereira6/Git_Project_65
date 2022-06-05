
import 'dart:ui';

import "package:flutter/material.dart";

import 'package:mythical_battles/constants.dart';
import 'package:mythical_battles/widget_builder.dart';

import '../../audio.dart';
import '../../change_page.dart';


class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // @override
  // initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   cameraController?.dispose();
  //   timer.cancel();
  //   super.dispose();
  // }


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
              ChangePage.ToBattlePage(context);
            }
            else {
              Audio.play(Constants.audioBatalha);
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
              Audio.play(Constants.audioDefinicoes);
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
              Audio.play(Constants.audioLoja);
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
            }
            else {
              Audio.play(Constants.audioBolsa);
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

    Constants.setScreenWidth(MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio);
    Constants.setScreenHeight(MediaQuery.of(context).size.height * MediaQuery.of(context).devicePixelRatio);

    Constants.refreshStats();

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: ()  {},
          child:
          const Center(child: Text('Página Principal')),
        ),
      ),
      body:
      LayoutBuilder(
        builder: (context, constaint) {
          return Stack(
            children: <Widget>[

              BackgroundWidget(constaint, context,
                  Constants.mainPageTitles, Constants.mainPageImageSrcs),
              WidgetBuilderFunctions.GestureDetectorWidget(context),
              WidgetBuilderFunctions.ChestReward(),

            ],
          );
        },
      ),
    );

  }
}





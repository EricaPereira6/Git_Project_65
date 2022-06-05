
import "package:flutter/material.dart";

import 'package:mythical_battles/constants.dart';
import '../../audio.dart';
import '../../change_page.dart';


class BattleResultPage extends StatefulWidget {
  BattleResultPage({Key? key}) : super(key: key);

  @override
  _BattleResultPageState createState() => _BattleResultPageState();
}

class _BattleResultPageState extends State<BattleResultPage> {

  Quadrants? lastQuadTouched;

  static Result(context){
    return SizedBox( width: Constants.screenWidth, child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        const SizedBox(height: 30,),
        InkWell(
          onTap: ()  {
            Audio.play(Constants.audioButton);
            ChangePage.ToMainPage(context);
          },
          child:
          Image(image: const AssetImage(Constants.vencedorImageScr), width: (Constants.screenWidth / 3),),
        )
      ],
    ));
  }

  CombatCornerContainer (constaint, Quadrants quad, Color background,
      String title, {String? imageSrc}) {
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
            const SizedBox(height: 30,),
            Image(image: AssetImage(imageSrc!), height: (Constants.screenHeight / 15)),
            const SizedBox(height: 15,),
            Container( decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Constants.faixaImageSrc),
                fit: BoxFit.fill,
              ),),
                height: (Constants.screenWidth / 22.0),
                width: (Constants.screenWidth / 5.0),
                padding: const EdgeInsets.only(top: 6),
                child: Text(title,
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, )),
            const SizedBox(height: 15,),
          ],
        ),
      );
      case Quadrants.BOTTOM_LEFT:
        return Container(color: background,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage(imageSrc!), height: (Constants.screenHeight / 20)),
              const SizedBox(height: 15,),
              Container( decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Constants.faixaImageSrc),
                  fit: BoxFit.fill,
                ),),
                  height: (Constants.screenWidth / 22.0),
                  width: (Constants.screenWidth / 5.0),
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(title,
                    style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center, )),
              const SizedBox(height: 30,),
            ],
          ),
        );

      case Quadrants.BOTTOM_RIGHT:
        return Container(color: background,);
    }
  }

  BackgroundWidget (constaint, context, Color color) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: constaint.maxWidth / constaint.maxHeight,
      ),

      children: <Widget>[

        InkWell(
          onTap: () {
            Audio.play(Constants.audioButton);
            ChangePage.ToMainPage(context);
          },
          child:
          CombatCornerContainer (constaint, Quadrants.TOP_LEFT,
              color, "10 gems", imageSrc: Constants.gemImageScr),
        ),

        InkWell(
          onTap: () {
            Audio.play(Constants.audioButton);
            ChangePage.ToMainPage(context);
          },
          child:
          CombatCornerContainer (constaint, Quadrants.TOP_RIGHT,
              color, "15 EXP", imageSrc: Constants.expImageScr),
        ),

        InkWell(
          onTap: () {
            Audio.play(Constants.audioButton);
            ChangePage.ToMainPage(context);
          },
          child:
          CombatCornerContainer (constaint, Quadrants.BOTTOM_LEFT,
          color, "10 fusão", imageSrc: Constants.pontosFusaoImageScr),
        ),

        InkWell(
          onTap: ()  {
            Audio.play(Constants.audioButton);
            ChangePage.ToMainPage(context);
          },
          child:
          CombatCornerContainer (constaint, Quadrants.BOTTOM_RIGHT, color, ""),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: ()  {},
          child:
          const Center(child: Text('Página de Resultados')),
        ),
      ),
      body:
      LayoutBuilder(
        builder: (context, constaint) {
          return Stack(
            children: <Widget>[

              BackgroundWidget(
                  constaint, context, Colors.deepPurple),
              Result(context),

            ],
          );
        },
      ),
    );

  }
}
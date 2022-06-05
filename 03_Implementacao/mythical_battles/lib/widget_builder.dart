import 'dart:ui';

import "package:flutter/material.dart";

import 'package:mythical_battles/constants.dart';
import 'package:mythical_battles/audio.dart';
import 'package:mythical_battles/change_page.dart';


class WidgetBuilderFunctions {

  static bool batalhaPlayed = false;

  static _onDragStart(BuildContext context, DragStartDetails start) {
    // print("oi: " + start.globalPosition.toString());
    RenderBox getBox = context.findRenderObject() as RenderBox;
    var local = getBox.globalToLocal(start.globalPosition);
    // print("tudo bom: " + local.dx.toString() + "|" + local.dy.toString());
  }

  _onDragUpdate(BuildContext context, DragUpdateDetails update) {
    RenderBox getBox = context.findRenderObject() as RenderBox;
    var local = getBox.globalToLocal(update.globalPosition);

    print("-----------------------fuck: ${update.globalPosition}");
    return local;
  }

  static GestureDetectorWidget(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails start) =>
          _onDragStart(context, start),
      onHorizontalDragUpdate: (DragUpdateDetails update) {
        double pointerX = update.globalPosition.dx * MediaQuery.of(context).devicePixelRatio;
        double pointerY = update.globalPosition.dy * MediaQuery.of(context).devicePixelRatio;
        print("------width: ${Constants.screenWidth / 2} ------ $pointerX");
        print("------height: ${Constants.screenHeight / 2} ------ $pointerY");
        // print("------width: $screenWidth ------ ${MediaQuery.of(context).size.width}");
        // print("------height: $screenHeight ------ ${MediaQuery.of(context).size.height}|${MediaQuery.of(context).devicePixelRatio}");
        if (pointerX < (Constants.screenWidth / 2) && pointerY < (Constants.screenHeight / 2) && !batalhaPlayed) {
          Audio.play(Constants.audioBatalha);
          batalhaPlayed = true;
        }
        else{
          batalhaPlayed = false;
        }
      },
    );
  }

  static ChestReward(){
    return SizedBox( width: Constants.screenWidth, child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        Container( decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.faixaImageSrc),
            fit: BoxFit.fill,
          ),),
            height: (Constants.screenWidth / 22.0),
            width: (Constants.screenWidth / 5.0),
            padding: const EdgeInsets.only(top: 6),
            child: const Text(Constants.rewardTitle,
              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, )),
        Image(image: const AssetImage(Constants.rewardImageSrc), height: (Constants.screenHeight / 15.0),),
      ],
    ));
  }



  static CornerContainer (constaint, Quadrants quad, Color background, String title, String imageSrc) {
    switch(quad) {
      case Quadrants.TOP_LEFT:
      case Quadrants.TOP_RIGHT:
        return Container(color: background,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
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
                    style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center, )),
              Image(image: AssetImage(imageSrc)),
            ],
          ),
        );

      case Quadrants.BOTTOM_LEFT:
      case Quadrants.BOTTOM_RIGHT:
        return Container(color: background,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Image(image: AssetImage(imageSrc)),
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
                    style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center, )),
              const SizedBox(height: 15,),
            ],
          ),
        );
    }

  }

  static buttonContainers(context, constaint, Quadrants? lastQuadTouched,
      String title, String imageSrc, Screen screen){
    return InkWell(
      onTap: () {
        if (lastQuadTouched == Quadrants.TOP_LEFT) {
          lastQuadTouched = null;
          //change screen
          ChangePage.ToSetterPage(context, screen);
        }
        else {
          Audio.play(Constants.audioBatalha);
          lastQuadTouched = Quadrants.TOP_LEFT;
        }
      },
      child:
      WidgetBuilderFunctions.CornerContainer (constaint, Quadrants.TOP_LEFT, Colors.blueGrey,
          title, imageSrc),
    );
  }
}
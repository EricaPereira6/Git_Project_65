import "package:flutter/material.dart";

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

import 'package:mythical_battles/constants.dart';

class OponentsPage extends StatefulWidget {
  const OponentsPage({Key? key}) : super(key: key);

  @override
  _OponentsPageState createState() => _OponentsPageState();

}

class _OponentsPageState extends State<OponentsPage> {

  AudioPlayer audioPlayer = AudioPlayer();

  play(String audioAsset) async {
    ByteData bytes = await rootBundle.load(audioAsset); //load audio from assets
    Uint8List audioBytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    await audioPlayer.playBytes(audioBytes);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: ()  {},
          child:
          const Center(child: Text('Página Oponentes')),
        ),
      ),
      body:
      LayoutBuilder(
        builder: (context, constaint) {
          return Stack(
            children: <Widget>[

            ],
          );
        },
      ),
    );

  }
}

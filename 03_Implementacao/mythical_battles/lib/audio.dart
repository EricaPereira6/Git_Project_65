
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';


class Audio {

  static AudioPlayer audioPlayer = AudioPlayer();

  static play(String audioAsset) async {
    ByteData bytes = await rootBundle.load(audioAsset); //load audio from assets
    Uint8List audioBytes = bytes.buffer.asUint8List(
        bytes.offsetInBytes, bytes.lengthInBytes);

    await audioPlayer.playBytes(audioBytes);
  }
}
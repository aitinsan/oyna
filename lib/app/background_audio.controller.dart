import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class BackgroundAudio extends ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  bool playing = true;
  Future<void> start() async {
    ByteData bytes =
        await rootBundle.load('assets/audios/B.Zhanerke.mp3'); //load audio from assets
    var audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    player.playBytes(audiobytes);
    playing = true;
  }
  Future<void> stop() async {

    player.stop();
    playing = false;
  }
}

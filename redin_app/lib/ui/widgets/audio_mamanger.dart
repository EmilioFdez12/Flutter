import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();
  final AudioPlayer _audioPlayer = AudioPlayer();

  void playBackgroundMusic(String path) async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource(path));
  }

  void stopBackgroundMusic() async {
    await _audioPlayer.stop();
  }

}
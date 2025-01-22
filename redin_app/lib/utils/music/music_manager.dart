// audio_manager.dart
import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioPlayer _victoryPlayer = AudioPlayer(); // Reproductor para el sonido de victoria

  Future<void> playBackgroundMusic() async {
    await _audioPlayer.play(AssetSource('audio/casino.ogg')); // Ruta de tu archivo de música
    _audioPlayer.setReleaseMode(ReleaseMode.loop); // Reproducir en loop
  }

  Future<void> playVictorySound() async {
    await _victoryPlayer.play(AssetSource('audio/roulette/win.ogg')); // Ruta del sonido de victoria
  }

  Future<void> stopBackgroundMusic() async {
    await _audioPlayer.stop();
  }

  void dispose() {
    _audioPlayer.dispose();
    _victoryPlayer.dispose();
  }
}
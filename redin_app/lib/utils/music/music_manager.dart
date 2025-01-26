import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

class AudioManager extends WidgetsBindingObserver {
  final AudioPlayer _audioPlayer = AudioPlayer(); // Reproductor para la música de fondo
  final AudioPlayer _victoryPlayer = AudioPlayer(); // Reproductor para el sonido de victoria

  AudioManager() {
    // Inicializamos el listener para ver 
    // el estado de la app
    _initAppLifecycleListener(); 
  }

  // Método para reproducir la música de fondo
  Future<void> playBackgroundMusic() async {
    await _audioPlayer.play(AssetSource('audio/casino.ogg'));
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  // Método para reproducir el sonido de victoria
  Future<void> playVictorySound() async {
    await _victoryPlayer.play(AssetSource('audio/roulette/win.ogg'));
  }

  // Método para detener la música de fondo
  Future<void> stopBackgroundMusic() async {
    await _audioPlayer.stop(); // Detiene la reproducción de la música
  }

  // Método para pausar la música de fondo
  Future<void> pauseBackgroundMusic() async {
    await _audioPlayer.pause(); // Pausa la reproducción de la música
  }

  // Método para liberar los recursos
  void dispose() {
    _audioPlayer.dispose();
    _victoryPlayer.dispose(); 
    // Elimina el observer
    WidgetsBinding.instance.removeObserver(this); 
  }

  // Método para inicializar el listener del ciclo de vida de la aplicación
  void _initAppLifecycleListener() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // Si el audio no se está reproduciendo, se reanuda
        if (_audioPlayer.state != PlayerState.playing) {
          playBackgroundMusic();
        }
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        // Si el aduio se está reproduciendo, se pausa
        if (_audioPlayer.state == PlayerState.playing) {
          pauseBackgroundMusic();
        }
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }
}
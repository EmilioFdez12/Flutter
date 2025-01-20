import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class BackgroundMusic extends StatefulWidget {
  final String assetPath;
  final double volume;

  const BackgroundMusic({
    super.key,
    this.assetPath = 'audio/casino.ogg',
    this.volume = 1,
  });

  @override
  State<BackgroundMusic> createState() => _BackgroundMusicState();
}

class _BackgroundMusicState extends State<BackgroundMusic> with WidgetsBindingObserver {
  late AudioPlayer _audioPlayer;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    WidgetsBinding.instance.addObserver(this);
    _playMusic();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _pauseMusic();
    } else if (state == AppLifecycleState.resumed && _isPaused) {
      _resumeMusic();
    }
  }

  void _playMusic() async {
    try {
      await _audioPlayer.play(AssetSource(widget.assetPath), volume: widget.volume);
    } catch (e) {
      print("Error playing music: $e");
    }
  }

  void _pauseMusic() async {
    await _audioPlayer.pause();
    _isPaused = true;
  }

  void _resumeMusic() async {
    await _audioPlayer.resume();
    _isPaused = false;
  }

  @override
  Widget build(BuildContext context) {
    // This widget does not have a visual representation
    return const SizedBox.shrink();
  }
}


import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class FlorScreen extends StatefulWidget {
  const FlorScreen({super.key});

  @override
  State<FlorScreen> createState() => _FlorScreenState();
}

class _FlorScreenState extends State<FlorScreen> {

  late AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setReleaseMode(ReleaseMode.release);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await _audioPlayer.play(AssetSource('flores_amarillas.mp3'), volume: 0.2);
    });
  }

  void mostrarDialogo() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:(context) {
        return AlertDialog(
          title: const Text('Mi bebito 💚'),
          content: const Text('Aquí tienes un regalo por ser el noviecito más lindo del mundo.'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _audioPlayer.play(AssetSource('flores_amarillas.mp3'), volume: 0.2);
              },
              child: const Text('Comenzar')
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final isPhone = size.width < 600;
    final fontSize = isPhone ? 32.0 : 48.0;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            FadeIn(
              delay: const Duration(seconds: 9),
              duration: const Duration(seconds: 5),
              child: Text(
                'Para ti, mi amorcito',
                style: TextStyle(
                  fontSize: fontSize
                ),
              ),
            ),
            const Spacer(),
            FadeIn(
              delay: const Duration(seconds: 12),
              duration: const Duration(seconds: 3),
              child: Bounce(
                infinite: true,
                duration: const Duration(seconds: 8),
                child: Image.asset(
                  'assets/assets/flor.png',
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: FadeIn(
                duration: const Duration(seconds: 12),
                child: const Text('💚 21 - 09 - 2024 💙')
              ),
            )
          ],
        ),
      ),
    );
  }
}
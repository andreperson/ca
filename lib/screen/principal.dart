import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import '../components/animais.dart';
import 'inicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comunicação Alternativa AM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Principal(),
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final AudioCache _audioCache = AudioCache(
    prefix: 'audio/',
    fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comunicação Alternativa AM'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.indigo,
            border: Border.all(width: 4, color: Colors.indigoAccent),
          ),
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.indigo,
                ],
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //chama os principais
                  buildColumn(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      children: [
        new Image.asset(
          'images/animais.png',
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
        ElevatedButton(
          child: const Text('ANIMAIS'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Animais()),
            );
            playSound('animais.mp3');
          },
        ),
      ],
    );
  }
}
void playSound(String caminho) {
  final AudioCache _audioCache = AudioCache(
    prefix: 'audio/',
    fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
  );
  _audioCache.play(caminho);
}

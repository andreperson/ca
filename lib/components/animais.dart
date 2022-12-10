import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comunicação Alternativa AM',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Animais(),
    );
  }
}


class Animais extends StatefulWidget {
  const Animais({Key? key}) : super(key: key);

  @override
  State<Animais> createState() => _AnimaisState();
}

class _AnimaisState extends State<Animais> {

  final AudioCache _audioCache = AudioCache(
    prefix: 'audio/',
    fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
  );


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animais'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: Colors.amberAccent),
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
                      Colors.limeAccent,
                      Colors.amber,
                    ],
                  )
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  MontaLinha(primeiro: 'gato', segundo: 'cachorro', terceiro: 'coruja'),
                  MontaLinha(primeiro: 'vaca', segundo: 'cavalo', terceiro: 'ovelha'),
                  MontaLinha(primeiro: 'galo', segundo: 'galinha', terceiro: 'pintinho'),
                  MontaLinha(primeiro: 'leao', segundo: 'tigre', terceiro: 'elefante'),
                  MontaLinha(primeiro: 'passaro', segundo: 'aguia', terceiro: 'tucano'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MontaLinha extends StatelessWidget {
  final String primeiro;
  final String segundo;
  final String terceiro;


  const MontaLinha({
    Key? key, required this.primeiro, required this.segundo, required this.terceiro,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildColumn(primeiro),
        buildColumn(segundo),
        buildColumn(terceiro),
      ],
    );
  }

  Column buildColumn(final produto) {
    return Column(
        children: [
          new Image.asset(
            'images/animais/' + produto + '.png',
            width: 60.0,
            height: 60.0,
            fit: BoxFit.cover,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.amber),
            child: Text(produto.toUpperCase()),
            onPressed: () {
              playSound('animais/' + produto + '-texto.mp3');
              playSound('animais/' + produto + '.mp3');
            },
          ),
        ],
      );
  }
}


void playSound(String audio){
  final AudioCache _audioCache = AudioCache(
    prefix: 'audio/',
    fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
  );
  _audioCache.play(audio);

}


import 'package:ca/screen/principal.dart';
import 'package:flutter/material.dart';

class Inicial extends StatefulWidget {
  const Inicial({Key? key}) : super(key: key);

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  @override
  Widget build(BuildContext context) {

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      minimumSize: Size(100, 36),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );

    return MaterialApp(
      title: 'Comunicação Alternativa AM',
      home: Scaffold(
          body: new Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("images/ini.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(110.0),
                    child: new Center(
                        child: TextButton(
                          style: flatButtonStyle,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (
                                  context) => MyApp()),
                            );
                          },
                          child: new Text(
                            "ENTRAR",
                            style: new TextStyle(
                              shadows: [
                                Shadow(
                                  offset: Offset(2.0, 2.0), //position of shadow
                                  blurRadius: 8.0, //blur intensity of shadow
                                  color: Colors.black
                                      .withOpacity(
                                      0.8), //color of shadow with opacity
                                ),
                                //add more shadow with different position offset here
                              ],
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                ],
              )
            ],
          )),
    );
  }
}


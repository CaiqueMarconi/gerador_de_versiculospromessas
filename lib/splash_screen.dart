import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gerador_de_versiculospromessas/telas.dart';
import 'package:splashscreen/splashscreen.dart';

class SplaScreen extends StatefulWidget {
  @override
  _SplaScreenState createState() => _SplaScreenState();
}

class _SplaScreenState extends State<SplaScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashScreen(
        seconds: 2,
        backgroundColor: Colors.white,
        navigateAfterSeconds: Telas(),
      ),
        Center(
          child: Icon(MaterialCommunityIcons.library,
          size: 150, color: Colors.purple),
        ),
      ]
    );

  }
}


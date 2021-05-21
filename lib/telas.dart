import 'package:flutter/material.dart';
import 'package:gerador_de_versiculospromessas/home_page.dart';
import 'package:gerador_de_versiculospromessas/motivacao.dart';
import 'package:gerador_de_versiculospromessas/versiculo_do_dia.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';

enum CurrentPage{
  Promessas,
  Versiculos,
  Motivacao,
}

class Telas extends StatefulWidget {
  @override
  _TelasState createState() => _TelasState();
}

class _TelasState extends State<Telas> {

  CurrentPage selectedPage;
  int _indiceAtual = 1;

  bool current = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [ PageVersiculos(),HomePage(), MensMotivacional()];
    return Scaffold(
      body: screen[_indiceAtual],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        items: [
          TabItem(icon: Icons.auto_stories, title: 'Versiculos'),
          TabItem(icon: MaterialCommunityIcons.library,title: 'Promessas'),
          TabItem(icon: MaterialCommunityIcons.flash, title: 'Motivação'),
    ],
    backgroundColor: Colors.purple[400],

      )
    );
  }
}

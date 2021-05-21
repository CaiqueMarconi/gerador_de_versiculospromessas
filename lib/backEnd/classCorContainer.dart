import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Corcontainer extends StatelessWidget {

  final Color color;
  final VoidCallback onTap;
  final String title;
  final Color colour;

  const Corcontainer({Key key, this.color, this.onTap,this.colour, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
            minHeight: 50,
            maxHeight: double.infinity),
        margin: EdgeInsets.fromLTRB(10, 8, 10, 0),
        width:  MediaQuery.of(context).size.width*1,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AutoSizeText(title,
            minFontSize: 18,
            maxFontSize: 20,
            style: TextStyle(
                color: colour,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
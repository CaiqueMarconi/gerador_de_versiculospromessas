import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gerador_de_versiculospromessas/motivacao.dart';
import 'package:gerador_de_versiculospromessas/versiculo_do_dia.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'Listas/lista_promessas.dart';
import 'ad_state/intersticialAd.dart';
import 'backEnd/classCorContainer.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final pageoptions = [ HomePage(), PageVersiculos(), MensMotivacional(),];

  String PromessaGreen = "";
  String PromessaBlue = "";
  String PromessaOrange = "";
  String PromessaBrown = "";
  String PromessaPurple = "";
  String PromessaYellow = "";

  void gerarPromessaGreen() {
    var promessaSorteado = Random().nextInt(promessas.length);
    setState(() {
      PromessaGreen = promessas[promessaSorteado];
      showInterst();
    });
  }

  void gerarPromessaBlue() {
    var promessaSorteado = Random().nextInt(promessas.length);
    setState(() {
      PromessaBlue = promessas[promessaSorteado];
      showInterst();
    });
  }

  void gerarPromessaOrange() {
    var promessaSorteado = Random().nextInt(promessas.length);
    setState(() {
      PromessaOrange = promessas[promessaSorteado];
      showInterst();
    });
  }

  void gerarPromessaBrown() {
    var promessaSorteado = Random().nextInt(promessas.length);
    setState(() {
      PromessaBrown = promessas[promessaSorteado];
    });
  }

  void gerarPromessaPurple() {
    var promessaSorteado = Random().nextInt(promessas.length);
    setState(() {
      PromessaPurple = promessas[promessaSorteado];
      showInterst();
    });
  }

  void gerarPromessaYellow() {
    var promessaSorteado = Random().nextInt(promessas.length);
    setState(() {
      PromessaYellow = promessas[promessaSorteado];
      showInterst();
    });
  }

  InterstitialAd _interstitialAd;

  showInterst(){
    if(PromessaYellow == promessas[1] || PromessaBlue == promessas[1] ||
        PromessaGreen == promessas[1] || PromessaOrange == promessas[1] || PromessaPurple == promessas[1]){
      _interstitialAd.show();
    }
  }

  @override
  void initState() {
    super.initState();
    MobileAds.instance.initialize().then((InitializationStatus status) {
      print('Initialization done: ${status.adapterStatuses}');
      MobileAds.instance
          .updateRequestConfiguration(RequestConfiguration(
          tagForChildDirectedTreatment:
          TagForChildDirectedTreatment.unspecified))
          .then((void value) {
        createInterstitialAd();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text("Mensagem do Dia!",
        style: TextStyle(
          fontSize: 25
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              height: MediaQuery.of(context).size.height*.08,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                color: Colors.grey[400],
              ),
              child: Center(
                child: Text(" Promessas! \n escolha uma das cores abaixo!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
              Container(
                //color: Colors.blueAccent,
                //height: MediaQuery.of(context).size.height*.60,

                child: Column(
                  children: [
                    Corcontainer(
                      color: Colors.green,
                      title: PromessaGreen,
                      colour: Colors.white,
                      onTap: (){
                        if(PromessaPurple == "" && PromessaYellow == "" && PromessaBrown == "" && PromessaBlue == "" && PromessaOrange == ""){
                          setState(() {
                            gerarPromessaGreen();
                          });
                        }else {
                          PromessaGreen = "";
                        }
                      },
                    ),
                    Corcontainer(
                       color: Colors.blue,
                      title: PromessaBlue,
                      colour: Colors.white,
                      onTap: (){
                        if(PromessaPurple == "" && PromessaYellow == "" && PromessaBrown == "" && PromessaGreen == "" && PromessaOrange == ""){
                          setState(() {
                            gerarPromessaBlue();
                          });
                        }else {
                          PromessaBlue = "";
                        }
                      },
                     ),

                    Corcontainer(
                      color: Colors.orange,
                      title: PromessaOrange,
                      colour: Colors.white,
                      onTap: (){
                        if(PromessaPurple == "" && PromessaYellow == "" && PromessaBrown == "" && PromessaGreen == "" && PromessaBlue == ""){
                          setState(() {
                            gerarPromessaOrange();
                          });
                        }else {
                          PromessaOrange = "";
                        }
                      },
                    ),
                    Corcontainer(
                      color: Colors.brown,
                      title: PromessaBrown,
                      colour: Colors.white,
                      onTap: (){
                        if(PromessaPurple == "" && PromessaYellow == "" && PromessaBlue == "" && PromessaGreen == "" && PromessaOrange == ""){
                          setState(() {
                            gerarPromessaBrown();
                          });
                        }else {
                          PromessaBrown = "";
                        }
                      },
                    ),
                    Corcontainer(
                      color: Colors.purple[400],
                      title: PromessaPurple,
                      colour: Colors.white,
                      onTap: (){
                        if(PromessaBlue == "" && PromessaYellow == "" && PromessaBrown == "" && PromessaGreen == "" && PromessaOrange == ""){
                          setState(() {
                            gerarPromessaPurple();
                          });
                        }else {
                          PromessaPurple = "";
                        }
                      },
                    ),
                    Corcontainer(
                      color: Colors.yellow,
                      title: PromessaYellow,
                      colour: Colors.black,
                      onTap: (){
                        if(PromessaPurple == "" && PromessaBlue == "" && PromessaBrown == "" && PromessaGreen == "" && PromessaOrange == ""){
                          setState(() {
                            gerarPromessaYellow();
                          });
                        }else {
                          PromessaYellow = "";
                        }
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}




import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
//import 'package:share/share.dart';
import 'Listas/lista_motivacional.dart';
import 'ad_state/banner.dart';
import 'package:share_plus/share_plus.dart';

class MensMotivacional extends StatefulWidget {
  @override
  _MensMotivacionalState createState() => _MensMotivacionalState();
}

class _MensMotivacionalState extends State<MensMotivacional> {

  String text =
      "https://play.google.com/store/apps/details?id=marconi.com.gerador_de_versiculospromessas";

  String ButtonFrase = "";

  gerarFrase() {
    var fraseSorteada = Random().nextInt(FrasesMotivacionais.length);
    setState(() {
      ButtonFrase = FrasesMotivacionais[fraseSorteada];
    });
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox;

    await Share.share(text,
        subject: ButtonFrase,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  BannerAd banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  void initState() {
    gerarFrase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text(
          "Frase Motivacional",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
            height: MediaQuery.of(context).size.height * .50,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Text(
                    ButtonFrase,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5),
                  ),
                ),
              ],
            ),
          ),
           if (banner == null)
            SizedBox(
              height: 30,
            )
          else
            Container(
              height: 50,
              child: AdWidget(
                ad: banner,
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.purple[400],
                  onPressed: () {
                    setState(() {
                      _onShare(context);
                    });
                  },
                  child: Icon(Icons.share),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.purple[400],
                  onPressed: () {
                    setState(() {
                      gerarFrase();
                      if (ButtonFrase == FrasesMotivacionais[6]) {
                       // _interstitialAd.show();
                      }
                    });
                  },
                  child: Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

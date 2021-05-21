import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'Listas/lista_versiculos.dart';
import 'ad_state/banner.dart';


class PageVersiculos extends StatefulWidget {
  @override
  _PageVersiculosState createState() => _PageVersiculosState();
}

class _PageVersiculosState extends State<PageVersiculos> {
  String verseButtom = "";

  gerarVersiculo() {
    var versiculoSorteado = Random().nextInt(versiculos.length);
    setState(() {
      verseButtom = versiculos[versiculoSorteado];
    });
  }

 share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(verseButtom,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  void initState() {
    super.initState();
    gerarVersiculo();
  }

  BannerAd banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId2,
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text(
          "Versiculo do Dia!",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 05, 10, 0),
            height: MediaQuery.of(context).size.height * .58,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    verseButtom,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                    ),
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
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.purple[400],
                  child: IconButton(
                      icon: Icon(
                        Icons.share,
                      ),
                      onPressed: () {
                        setState(() {
                          share(context);
                        });
                      }),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.purple[400],
                  child: IconButton(
                      icon: Icon(
                        Icons.refresh,
                      ),
                      onPressed: () {
                        setState(() {
                          gerarVersiculo();
                        });
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
